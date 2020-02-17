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
        
        self.skView = SKView(frame: UIScreen.main.bounds)
        self.view.addSubview(skView)
        
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0
        let statusBarHeight = self.view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

        self.floatingCollectionScene = BubblesScene(size: skView.bounds.size)
        self.floatingCollectionScene.topOffset = navBarHeight + statusBarHeight + 200
        self.skView.presentScene(floatingCollectionScene)
        
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .done,
//            target: self,
//            action: #selector(self.commitSelection))
//
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .add,
//            target: self,
//            action: #selector(self.addBubble))
        
        for _ in 0..<20 {
            self.addBubble()
        }
    }
    
    @objc func addBubble() {
        let node = BubbleNode.make()
        self.floatingCollectionScene.addChild(node)
    }
    
    @objc func commitSelection() {
        self.floatingCollectionScene.performCommitSelectionAnimation()
    }
}

