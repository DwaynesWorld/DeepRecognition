//
//  BubbleNode.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import SpriteKit

class BubbleNode: FloatingNode {
    var labelNode = SKLabelNode(fontNamed: "")
    
    class func make() -> BubbleNode {
        let node = BubbleNode(circleOfRadius: 30)
        self.configureNode(node)
        return node
    }
    
    class func configureNode(_ node: BubbleNode) {
        let boundingBox = node.path?.boundingBox;
        let radius = (boundingBox?.size.width)! / 2.0;
        node.physicsBody = SKPhysicsBody(circleOfRadius: radius + 1.5)
        node.fillColor = SKColor.black
        node.strokeColor = node.fillColor
        
        node.labelNode.text = "Hello"
        node.labelNode.position = CGPoint.zero
        node.labelNode.fontColor = SKColor.white
        node.labelNode.fontSize = 10
        node.labelNode.fontName = "Helvetica"
        node.labelNode.isUserInteractionEnabled = false
        node.labelNode.verticalAlignmentMode = .center
        node.labelNode.horizontalAlignmentMode = .center
        node.addChild(node.labelNode)
    }
    
    override func selectingAnimation() -> SKAction? {
        return SKAction.scale(to: 1.5, duration: 0.3)
    }
    
    override func normalizeAnimation() -> SKAction? {
        return SKAction.scale(to: 1, duration: 0.2)
    }
    
    override func removeAnimation() -> SKAction? {
        return SKAction.fadeOut(withDuration: 0.2)
    }
    
    override func removingAnimation() -> SKAction {
        let pulseUp = SKAction.scale(to: xScale + 0.13, duration: 0)
        let pulseDown = SKAction.scale(to: xScale, duration: 0.3)
        let pulse = SKAction.sequence([pulseUp, pulseDown])
        let repeatPulse = SKAction.repeatForever(pulse)
        return repeatPulse
    }
    
    func `throw`(to point: CGPoint, completion block: @escaping (() -> Void)) {
        self.removeAllActions()
        let movingXAction = SKAction.moveTo(x: point.x, duration: 0.2)
        let movingYAction = SKAction.moveTo(y: point.y, duration: 0.4)
        let resize = SKAction.scale(to: 0.3, duration: 0.4)
        let throwAction = SKAction.group([movingXAction, movingYAction, resize])
        self.run(throwAction, completion: block)
    }
}
