//
//  TestViewController.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/16/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import UIKit
import SpriteKit

class TestViewController: UIViewController {
    private var skView: SKView!
    private var floatingCollectionScene: BubblesScene!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skView = SKView(frame: UIScreen.main.bounds)
        view.addSubview(skView)
        
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        floatingCollectionScene.topOffset = navBarHeight + statusBarHeight + 200
        skView.presentScene(floatingCollectionScene)
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .done,
//            target: self,
//            action: #selector(commitSelection))
//
//        navigationItem.leftBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: #selector(addBubble))
        
        for _ in 0..<2 {
            addBubble()
        }
    }
    
    @objc
    func addBubble() {
        let node = BubbleNode.make()
        floatingCollectionScene.addChild(node)
    }
    
    @objc
    func commitSelection() {
        floatingCollectionScene.performCommitSelectionAnimation()
    }
}

