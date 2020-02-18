//
//  FloatingCollectionScene.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SpriteKit

open class FloatingCollectionScene: SKScene {
    public private(set) var magneticField = SKFieldNode.radialGravityField()
    
    private(set) var mode: FloatingCollectionSceneMode = .normal {
        didSet {
            modeUpdated()
        }
    }
    
    public private(set) var floatingNodes: [FloatingNode] = []
    
    private var touchPoint: CGPoint?
    private var touchStartedTime: TimeInterval?
    private var removingStartedTime: TimeInterval?
    
    open var timeToStartRemoving: TimeInterval = 0.7
    open var timeToRemove: TimeInterval = 2
    open var allowEditing = false
    open var allowMultipleSelection = true
    open var restrictedToBounds = true
    open var pushStrength: CGFloat = 10000
    
    open weak var floatingDelegate: FloatingCollectionSceneDelegate?
    
    override open func didMove(to view: SKView) {
        super.didMove(to: view)
        self.configure()
    }
    
    // MARK: Frame Updates
    // TODO: refactoring
    override open func update(_ currentTime: TimeInterval) {
        floatingNodes.forEach { node in
            let distanceFromCenter = self.magneticField.position.distance(from: node.position)
            node.physicsBody?.linearDamping = 2
            
            if distanceFromCenter <= 100 {
                node.physicsBody?.linearDamping += ((100 - distanceFromCenter) / 10)
            }
        }

        if mode == .moving || !allowEditing {
            return
        }
        
        if let touchStartedTime = touchStartedTime, let touchPoint = touchPoint {
            let deltaTime = currentTime - touchStartedTime
            if deltaTime >= timeToStartRemoving {
                self.touchStartedTime = nil
                
                if let node = atPoint(touchPoint) as? FloatingNode {
                    removingStartedTime = currentTime
                    startRemovingNode(node)
                }
            }
        } else if mode == .editing, let removingStartedTime = removingStartedTime, let touchPoint = touchPoint {
            let deltaTime = currentTime - removingStartedTime
            
            if deltaTime >= timeToRemove {
                self.removingStartedTime = nil
                
                if let node = atPoint(touchPoint) as? FloatingNode {
                    if let index = floatingNodes.firstIndex(of: node) {
                        removeFloatingNode(at: index)
                    }
                }
            }
        }
    }
    
    // MARK: Touching Handlers
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            touchPoint = touch.location(in: self)
            touchStartedTime = touch.timestamp
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if mode == .editing {
            return
        }
        
        if let touch = touches.first as UITouch? {
            let plin = touch.previousLocation(in: self)
            let lin = touch.location(in: self)
            var dx = lin.x - plin.x
            var dy = lin.y - plin.y
            let b = sqrt(pow(lin.x, 2) + pow(lin.y, 2))
            dx = b == 0 ? 0 : (dx / b)
            dy = b == 0 ? 0 : (dy / b)
            
            if dx == 0 && dy == 0 {
                return
            } else if mode != .moving {
               mode = .moving
            }
            
            for node in floatingNodes {
                let w = node.frame.size.width / 2
                let h = node.frame.size.height / 2
                var direction = CGVector(
                    dx: pushStrength * dx,
                    dy: pushStrength * dy
                )
                
                if restrictedToBounds {
                    if !(-w...(size.width + w) ~= node.position.x) && (node.position.x * dx) > 0 {
                        direction.dx = 0
                    }
                    
                    if !(-h...(size.height + h) ~= node.position.y) && (node.position.y * dy) > 0 {
                        direction.dy = 0
                    }
                }
                
                node.physicsBody?.applyForce(direction)
            }
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if mode != .moving, let touchPoint = touchPoint {
            if let node = atPoint(touchPoint) as? FloatingNode {
                updateState(of: node)
            }
        }
        
        mode = .normal
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        mode = .normal
    }
    
    // MARK: Nodes Manipulation
    private func cancelRemovingNode(_ node: FloatingNode!) {
        mode = .normal
        node.physicsBody?.isDynamic = true
        node.state = node.previousState
        
        if let index = floatingNodes.firstIndex(of: node) {
            floatingDelegate?.floatingScene?(self, canceledRemovingOfFloatingNodeAt: index)
        }
    }
    
    open func floatingNode(at index: Int) -> FloatingNode? {
        if 0..<floatingNodes.count ~= index {
            return floatingNodes[index]
        }
        
        return nil
    }
    
    open func indexOfSelectedNode() -> Int? {
        return indexesOfSelectedNodes().first
    }
    
    open func indexesOfSelectedNodes() -> [Int] {
        var indexes: [Int] = []
        
        for (i, node) in floatingNodes.enumerated() {
            if node.state == .selected {
                indexes.append(i)
            }
        }
        
        return indexes
    }
    
    override open func atPoint(_ p: CGPoint) -> SKNode {
        var currentNode = super.atPoint(p)
        
        while !(currentNode.parent is SKScene)
            && !(currentNode is FloatingNode)
            && (currentNode.parent != nil)
            && !currentNode.isUserInteractionEnabled {
                currentNode = currentNode.parent!
        }
        
        return currentNode
    }
    
    open func removeFloatingNode(at index: Int) {
        if shouldRemoveNode(at: index) {
            let node = floatingNodes[index]
            floatingNodes.remove(at: index)
            node.removeFromParent()
            floatingDelegate?.floatingScene?(self, didRemoveFloatingNodeAt: index)
        }
    }
    
    private func startRemovingNode(_ node: FloatingNode) {
        mode = .editing
        node.physicsBody?.isDynamic = false
        node.state = .removing
        
        if let index = floatingNodes.firstIndex(of: node) {
            floatingDelegate?.floatingScene?(self, startedRemovingOfFloatingNodeAt: index)
        }
    }
    
    private func updateState(of node: FloatingNode) {
        if let index = floatingNodes.firstIndex(of: node) {
            switch node.state {
            case .normal:
                if shouldSelectNode(at: index) {
                    if !allowMultipleSelection, let selectedIndex = indexOfSelectedNode() {
                        let node = floatingNodes[selectedIndex]
                        updateState(of: node)
                    }
                    
                    node.state = .selected
                    floatingDelegate?.floatingScene?(self, didSelectFloatingNodeAt: index)
                }
            case .selected:
                if shouldDeselectNode(at: index) {
                    node.state = .normal
                    floatingDelegate?.floatingScene?(self, didDeselectFloatingNodeAt: index)
                }
            case .removing:
                cancelRemovingNode(node)
            }
        }
    }
    
    // MARK: Configuration
    override open func addChild(_ node: SKNode) {
        if let newNode = node as? FloatingNode {
            self.configureNode(newNode)
            self.floatingNodes.append(newNode)
        }
        
        super.addChild(node)
    }
    
    private func configure() {
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.magneticField = SKFieldNode.radialGravityField()
        self.magneticField.region = SKRegion(radius: 10000)
        self.magneticField.minimumRadius = 10000
        self.magneticField.strength = 8000
        self.magneticField.position = CGPoint(x: size.width / 2, y: size.height / 2)
        self.magneticField.texture = SKTexture(image: .init(icon: .dripicon(.alarm), size: CGSize(width: 20, height: 20)))
        self.addChild(self.magneticField)
    }
    
    private func configureNode(_ node: FloatingNode!) {
        if node.physicsBody == nil {
            let path = node.path ?? CGMutablePath()
            node.physicsBody = SKPhysicsBody(polygonFrom: path)
        }
        
        node.physicsBody?.isDynamic = true
        node.physicsBody?.affectedByGravity = false
        node.physicsBody?.allowsRotation = false
        node.physicsBody?.mass = 0.3
        node.physicsBody?.friction = 0
        node.physicsBody?.linearDamping = 3
    }
    
    private func modeUpdated() {
        switch mode {
        case .normal, .moving:
            self.touchStartedTime = nil
            self.removingStartedTime = nil
            self.touchPoint = nil
        default: ()
        }
    }
    
    // MARK: Floating Delegate Helpers
    private func shouldRemoveNode(at index: Int) -> Bool {
        if 0..<self.floatingNodes.count ~= index {
            if let shouldRemove = self.floatingDelegate?.floatingScene?(self, shouldRemoveFloatingNodeAt: index) {
                return shouldRemove
            }
            
            return true
        }
        
        return false
    }
    
    private func shouldSelectNode(at index: Int) -> Bool {
        if let shouldSelect = self.floatingDelegate?.floatingScene?(self, shouldSelectFloatingNodeAt: index) {
            return shouldSelect
        }
        return true
    }
    
    private func shouldDeselectNode(at index: Int) -> Bool {
        if let shouldDeselect = self.floatingDelegate?.floatingScene?(self, shouldDeselectFloatingNodeAt: index) {
            return shouldDeselect
        }
        
        return true
    }
}


