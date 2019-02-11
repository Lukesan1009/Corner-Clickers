//
//  GameViewController.swift
//  Collisions
//
//  Created by 90303107 on 1/7/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            //view.showsPhysics = true // THIS LINE ADDED
            
            view.ignoresSiblingOrder = true
            view.isMultipleTouchEnabled = true
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
