//
//  Reset.swift
//  Collisions
//
//  Created by 90303107 on 1/14/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Reset {
    private var reset: SKLabelNode
    
    init() {
        reset = SKLabelNode(text: "reset")
        reset.position = CGPoint(x: 0, y: 0)
        reset.fontSize = 25
        reset.fontName = "HelveticaNeue-Light"
        reset.fontColor = UIColor.black
    }
    
    func add(env: GameScene) {
        env.addChild(reset)
    }
    
    func getSprite() -> SKLabelNode {
        return self.reset
    }
    
    func button(resetButton: Reset, nodeArray: [SKSpriteNode], env: GameScene, scoreLabel: Label, blue: Shape, fingerPosition: CGPoint) {
        if resetButton.getSprite().contains(fingerPosition) {
            
            while env.nodeArray.count > 0 {
                env.nodeArray[0].removeFromParent()
                env.nodeArray.remove(at: 0)
            }
            
            blue.getSprite().physicsBody?.isDynamic = false
            
            env.speedCost = 5
            UserDefaults.standard.set(env.speedCost, forKey: "speedCost")
            
            env.score = 0
            UserDefaults.standard.set(env.score, forKey: "score")
            
            env.speedLevel = 1
            UserDefaults.standard.set("0", forKey: "speedLevel")
            
            env.ballCost = 20
            UserDefaults.standard.set(env.ballCost, forKey: "ballCost")
            
            env.ballLevel = 1
            UserDefaults.standard.set(env.ballLevel, forKey: "ballLevel")

            env.greenBought = false
            UserDefaults.standard.set(env.greenBought, forKey: "greenBought")
            
            env.whiteBought = false
            UserDefaults.standard.set(env.greenBought, forKey: "whiteBought")
            
            env.firstTime = 0
            UserDefaults.standard.set(env.firstTime, forKey: "firstTime")
            
            env.blackBGPurchase = false
            UserDefaults.standard.set(env.blackBGPurchase, forKey: "blackBGPurchase")
            
            env.startBG = "white"
            UserDefaults.standard.set(env.startBG, forKey: "background")

            
            scoreLabel.getSprite().text = "0"
        }
    }
}
