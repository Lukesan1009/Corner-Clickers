//
//  Backgrounds.swift
//  Collisions
//
//  Created by 90303107 on 1/23/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class WhiteBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 93)
        color.size.width = 125
        color.size.height = 50
        color.zPosition = 9
    }
    
    func add(env: GameScene) {
        env.addChild(color)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.color
    }
    
    func move() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -73), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 93), duration: (1/3))
        getSprite().run(moveBlue)
    }
    func touched(env: GameScene, whiteBG: WhiteBackground, score: Label, whiteBGCost: WhiteBackgroundCost, blackBGCost: BlackBackgroundCost, fingerPosition: CGPoint, box: Box) {
        
        if whiteBG.getSprite().contains(fingerPosition) && env.backgroundColor != UIColor.white {
            env.backgroundColor = UIColor.white
            score.getSprite().fontColor = UIColor.black
            box.getSprite().texture = SKTexture(imageNamed: "box")
            var count = env.cornerArray.count
            while count > 0 {
                env.cornerArray[count - 1].texture = SKTexture(imageNamed: "white")
                count -= 1
            }
            
            whiteBGCost.getSprite().text = "Selected"
            if env.blackBGPurchase == true {
                blackBGCost.getSprite().text = "Select"
            }
            
            env.startBG = "white"
            UserDefaults.standard.set(env.startBG, forKey: "background")
        }
    }
}

class WhiteBackgroundCost {
    private var text: SKLabelNode
    
    init() {
        text = SKLabelNode(text: "Selected")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 100)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -80), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 100), duration: (1/3))
        getSprite().run(moveText)
    }
}

class WhiteBackgroundText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "White Background")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.numberOfLines = 0
        add.preferredMaxLayoutWidth = 110
        add.position = CGPoint(x: -60, y: -(Dimensions().screenHeight() - 118))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -75, y: -98), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -60, y: -(Dimensions().screenHeight()) - 118), duration: (1/4))
        getSprite().run(move)
    }
}

//////////////////////////////////////////////////
/////////////////////////////////////////////////

class BlackBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 168)
        color.size.width = 125
        color.size.height = 50
        color.zPosition = 9
    }
    
    func add(env: GameScene) {
        env.addChild(color)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.color
    }
    
    func move() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -148), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 168), duration: (1/3))
        getSprite().run(moveBlue)
    }
    func touched(env: GameScene, blackBG: BlackBackground, score: Label, whiteBGCost: WhiteBackgroundCost, blackBGCost: BlackBackgroundCost, fingerPosition: CGPoint, box: Box, scoreLabel: Label) {
        
        if (blackBG.getSprite().contains(fingerPosition) && env.score >= 5000) || (blackBG.getSprite().contains(fingerPosition) && env.blackBGPurchase == true) {
            env.backgroundColor = UIColor.black
            score.getSprite().fontColor = UIColor.white
            box.getSprite().texture = SKTexture(imageNamed: "blackbox")
            
            var count = env.cornerArray.count
            while count > 0 {
                env.cornerArray[count - 1].texture = SKTexture(imageNamed: "black")
                count -= 1
            }
            
            if env.blackBGPurchase == false {

                env.score -= 5000
                UserDefaults.standard.set(env.score, forKey: "score")
                scoreLabel.getSprite().text = String(env.score)
                env.blackBGPurchase = true
                UserDefaults.standard.set(env.blackBGPurchase, forKey: "blackBGPurchase")

            }
            blackBGCost.getSprite().text = "Selected"

            env.startBG = "black"
            UserDefaults.standard.set(env.startBG, forKey: "background")

            whiteBGCost.getSprite().text = "Select"
        }
    }
}

class BlackBackgroundCost {
    private var text: SKLabelNode
    
    init(cost: Int) {
        text = SKLabelNode(text: "Cost: \(cost)")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 175)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -155), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 175), duration: (1/3))
        getSprite().run(moveText)
    }
}

class BlackBackgroundText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "Black Background")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.numberOfLines = 0
        add.preferredMaxLayoutWidth = 110
        add.position = CGPoint(x: -60, y: -(Dimensions().screenHeight() - 193))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -75, y: -173), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -60, y: -(Dimensions().screenHeight()) - 193), duration: (1/4))
        getSprite().run(move)
    }
}
