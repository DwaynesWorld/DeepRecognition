//
//  BubblesScene.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SpriteKit

class BubblesScene: FloatingCollectionScene {
    var bottomOffset: CGFloat = 200
    var topOffset: CGFloat = 0
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        self.configure()
    }
    
    fileprivate func configure() {
        self.backgroundColor = .rgb(242, 245, 248)
        self.scaleMode = .aspectFill
        self.allowMultipleSelection = true
        self.allowEditing = true
        
        var bodyFrame = self.frame
        bodyFrame.size.width = CGFloat(self.magneticField.minimumRadius)
        bodyFrame.origin.x -= bodyFrame.size.width / 2
        bodyFrame.size.height = frame.size.height - self.bottomOffset
        bodyFrame.origin.y = frame.size.height - bodyFrame.size.height - self.topOffset
        
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: bodyFrame)
        self.magneticField.position = CGPoint(
            x: frame.size.width / 2,
            y: frame.size.height / 2 + self.bottomOffset / 2 - self.topOffset)
    }
    
    override func addChild(_ node: SKNode) {
        if node is BubbleNode {
            var x = CGFloat.random(min: -self.bottomOffset, max: -node.frame.size.width)
            let y = CGFloat.random(
                min: frame.size.height - self.bottomOffset - node.frame.size.height,
                max: frame.size.height - self.topOffset - node.frame.size.height)
            
            if self.floatingNodes.count % 2 == 0 || self.floatingNodes.isEmpty {
                x = CGFloat.random(
                    min: frame.size.width + node.frame.size.width,
                    max: frame.size.width + self.bottomOffset)
            }
            
            node.position = CGPoint(x: x, y: y)
        }
        
        super.addChild(node)
    }
    
    func performCommitSelectionAnimation() {
        let currentPhysicsSpeed = self.physicsWorld.speed
        self.physicsWorld.speed = 0
        let sortedNodes = self.sortedFloatingNodes()
        var actions: [SKAction] = []
        
        for node in sortedNodes {
            node.physicsBody = nil
            let action = self.actionForFloatingNode(node)
            actions.append(action)
        }
        
        self.run(SKAction.sequence(actions)) { [weak self] in
            self?.physicsWorld.speed = currentPhysicsSpeed
        }
    }

    func sortedFloatingNodes() -> [FloatingNode] {
        return self.floatingNodes.sorted { (node: FloatingNode, nextNode: FloatingNode) -> Bool in
            let distance = node.position.distance(from: self.magneticField.position)
            let nextDistance = nextNode.position.distance(from: self.magneticField.position)
            return distance < nextDistance && node.state != .selected
        }
    }
    
    func actionForFloatingNode(_ node: FloatingNode!) -> SKAction {
        let action = SKAction.run { [unowned self] () -> Void in
            if let index = self.floatingNodes.firstIndex(of: node) {
                self.removeFloatingNode(at: index)
                
                if node.state == .selected {
                    let destinationPoint = CGPoint(x: self.size.width / 2, y: self.size.height + 40)
                    (node as? BubbleNode)?.throw(to: destinationPoint) {
                        node.removeFromParent()
                    }
                }
            }
        }
        
        return action
    }
}

extension CGFloat {
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat(Float.random(in: Float(min)...Float(max)))
    }
}

