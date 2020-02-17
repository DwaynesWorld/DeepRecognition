//
//  FloatingNode.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/18/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import SpriteKit

open class FloatingNode: SKShapeNode {
    private(set) var previousState: FloatingNodeState = .normal
    
    public var state: FloatingNodeState = .normal {
        didSet {
            if state != oldValue {
                self.previousState = oldValue
                self.stateChanged()
            }
        }
    }
    
    private static let removingKey = "action.removing"
    private static let selectingKey = "action.selecting"
    private static let normalizeKey = "action.normalize"
    
    private func stateChanged() {
        var action: SKAction?
        var actionKey: String?
        
        switch state {
        case .normal:
            action = self.normalizeAnimation()
            actionKey = FloatingNode.normalizeKey
        case .selected:
            action = self.selectingAnimation()
            actionKey = FloatingNode.selectingKey
        case .removing:
            action = self.removingAnimation()
            actionKey = FloatingNode.removingKey
        }
        
        if let action = action, let actionKey = actionKey {
            self.removeAction(forKey: actionKey)
            self.run(action, withKey: actionKey)
        }
    }
    
    override open func removeFromParent() {
        if let action = self.removeAnimation() {
            self.run(action) {
                super.removeFromParent()
            }
        } else {
            super.removeFromParent()
        }
    }
    
    // MARK: -
    // MARK: Animations
    open func selectingAnimation() -> SKAction? { return nil }
    open func normalizeAnimation() -> SKAction? { return nil }
    open func removeAnimation() -> SKAction? { return nil }
    open func removingAnimation() -> SKAction? { return nil }
}
