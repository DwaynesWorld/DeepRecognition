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
            self.modeUpdated()
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
    
    // MARK: -
    // MARK: Frame Updates
    // TODO: refactoring
    override open func update(_ currentTime: TimeInterval) {
        self.floatingNodes.forEach { node in
            let distanceFromCenter = self.magneticField.position.distance(from: node.position)
            node.physicsBody?.linearDamping = 2
            
            if distanceFromCenter <= 100 {
                node.physicsBody?.linearDamping += ((100 - distanceFromCenter) / 10)
            }
        }

        if self.mode == .moving || !self.allowEditing {
            return
        }
        
        if let touchStartedTime = self.touchStartedTime, let touchPoint = self.touchPoint {
            let deltaTime = currentTime - touchStartedTime
            if deltaTime >= self.timeToStartRemoving {
                self.touchStartedTime = nil
                
                if let node = atPoint(touchPoint) as? FloatingNode {
                    self.removingStartedTime = currentTime
                    self.startRemovingNode(node)
                }
            }
        } else if mode == .editing, let removingStartedTime = self.removingStartedTime, let touchPoint = self.touchPoint {
            let deltaTime = currentTime - removingStartedTime
            
            if deltaTime >= timeToRemove {
                self.removingStartedTime = nil
                
                if let node = self.atPoint(touchPoint) as? FloatingNode {
                    if let index = self.floatingNodes.firstIndex(of: node) {
                        self.removeFloatingNode(at: index)
                    }
                }
            }
        }
    }
    
    // MARK: -
    // MARK: Touching Handlers
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first as UITouch? {
            self.touchPoint = touch.location(in: self)
            self.touchStartedTime = touch.timestamp
        }
    }
    
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.mode == .editing {
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
            } else if self.mode != .moving {
               self.mode = .moving
            }
            
            for node in self.floatingNodes {
                let w = node.frame.size.width / 2
                let h = node.frame.size.height / 2
                var direction = CGVector(
                    dx: self.pushStrength * dx,
                    dy: self.pushStrength * dy
                )
                
                if self.restrictedToBounds {
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
        if self.mode != .moving, let touchPoint = touchPoint {
            if let node = self.atPoint(touchPoint) as? FloatingNode {
                self.updateState(of: node)
            }
        }
        
        self.mode = .normal
    }
    
    override open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.mode = .normal
    }
    
    // MARK: -
    // MARK: Nodes Manipulation
    private func cancelRemovingNode(_ node: FloatingNode!) {
        self.mode = .normal
        node.physicsBody?.isDynamic = true
        node.state = node.previousState
        
        if let index = self.floatingNodes.firstIndex(of: node) {
            self.floatingDelegate?.floatingScene?(self, canceledRemovingOfFloatingNodeAt: index)
        }
    }
    
    open func floatingNode(at index: Int) -> FloatingNode? {
        if 0..<self.floatingNodes.count ~= index {
            return self.floatingNodes[index]
        }
        
        return nil
    }
    
    open func indexOfSelectedNode() -> Int? {
        return self.indexesOfSelectedNodes().first
    }
    
    open func indexesOfSelectedNodes() -> [Int] {
        var indexes: [Int] = []
        
        for (i, node) in self.floatingNodes.enumerated() {
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
            let node = self.floatingNodes[index]
            self.floatingNodes.remove(at: index)
            node.removeFromParent()
            self.floatingDelegate?.floatingScene?(self, didRemoveFloatingNodeAt: index)
        }
    }
    
    private func startRemovingNode(_ node: FloatingNode) {
        self.mode = .editing
        node.physicsBody?.isDynamic = false
        node.state = .removing
        
        if let index = floatingNodes.firstIndex(of: node) {
            self.floatingDelegate?.floatingScene?(self, startedRemovingOfFloatingNodeAt: index)
        }
    }
    
    private func updateState(of node: FloatingNode) {
        if let index = floatingNodes.firstIndex(of: node) {
            switch node.state {
            case .normal:
                if self.shouldSelectNode(at: index) {
                    if !self.allowMultipleSelection, let selectedIndex = self.indexOfSelectedNode() {
                        let node = self.floatingNodes[selectedIndex]
                        self.updateState(of: node)
                    }
                    
                    node.state = .selected
                    self.floatingDelegate?.floatingScene?(self, didSelectFloatingNodeAt: index)
                }
            case .selected:
                if self.shouldDeselectNode(at: index) {
                    node.state = .normal
                    self.floatingDelegate?.floatingScene?(self, didDeselectFloatingNodeAt: index)
                }
            case .removing:
                self.cancelRemovingNode(node)
            }
        }
    }
    
    // MARK: -
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
    
    // MARK: -
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

extension CGPoint {
    func distance(from point: CGPoint) -> CGFloat {
        return hypot(point.x - self.x, point.y - self.y)
    }
}
