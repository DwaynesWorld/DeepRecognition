//
//  FloatingCollectionSceneDelegate.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

@objc public protocol FloatingCollectionSceneDelegate {
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, shouldSelectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, didSelectFloatingNodeAt index: Int)
    
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, shouldDeselectFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, didDeselectFloatingNodeAt index: Int)
    
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, startedRemovingOfFloatingNodeAt index: Int)
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, canceledRemovingOfFloatingNodeAt index: Int)
    
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, shouldRemoveFloatingNodeAt index: Int) -> Bool
    @objc optional func floatingScene(_ scene: FloatingCollectionScene, didRemoveFloatingNodeAt index: Int)
}
