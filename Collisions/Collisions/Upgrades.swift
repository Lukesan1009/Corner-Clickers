//
//  Upgrades.swift
//  Collisions
//
//  Created by 90303107 on 1/16/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class AddSpeed {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "Ball Speed: +5%")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.position = CGPoint(x: -60, y: -(Dimensions().screenHeight() + 125))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -60, y: 125), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -60, y: -(Dimensions().screenHeight() + 125)), duration: (1/4))
        getSprite().run(move)
    }
}

class SpeedText {
    private var text: SKLabelNode
    
    init(cost: Int) {
        text = SKLabelNode(text: "Cost: \(cost)")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 125)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 80, y: 125), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 125), duration: (1/3))
        getSprite().run(moveText)
    }
}

class SpeedTextBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 132)
        color.size.width = 100
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
        let moveBlue = SKAction.move(to: CGPoint(x: 80, y: 132), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 132), duration: (1/3))
        getSprite().run(moveBlue)
    }
    
    func touched(fingerPosition: CGPoint, env: GameScene, speedTextBG: SpeedTextBackground, blue: SKSpriteNode, veloX: CGFloat, veloY: CGFloat, scoreLabel: Label, speedText: SpeedText, nodeArray: [SKSpriteNode], count: Int) {
        
        if env.speedCost < 120 {
            if speedTextBG.getSprite().contains(fingerPosition) && env.score >= env.speedCost {
                
                
                if veloX < CGFloat(0.0) && veloY < CGFloat(0.0) {
                    blue.physicsBody?.applyImpulse(CGVector(dx: -40, dy: -48))
                }
                else if veloX < CGFloat(0.0) && veloY > CGFloat(0.0) {
                    blue.physicsBody?.applyImpulse(CGVector(dx: -40, dy: 48))
                }
                else if veloX > CGFloat(0.0) && veloY < CGFloat(0.0) {
                    blue.physicsBody?.applyImpulse(CGVector(dx: 40, dy: -48))
                }
                else if veloX > CGFloat(0.0) && veloY > CGFloat(0.0) {
                    blue.physicsBody?.applyImpulse(CGVector(dx: 40, dy: 48))
                }
                
                if count == nodeArray.count - 1 {
                    env.score -= env.speedCost
                    env.speedCost += 10
                    env.speedLevel += 1
                    
                    scoreLabel.getSprite().text = String(env.score)
                    speedText.getSprite().text = "Cost: \(env.speedCost)"
                    
                    UserDefaults.standard.set(env.score, forKey: "score")
                    UserDefaults.standard.set(env.speedCost, forKey: "speedCost")
                    UserDefaults.standard.set(env.speedLevel, forKey: "speedLevel")
                }
            }
        }
        else {
            speedText.getSprite().text = "Max"
        }
    }
}

class AddBallCost {
    private var text: SKLabelNode
    
    init(cost: Int) {
        text = SKLabelNode(text: "Cost: \(cost)")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 50)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 80, y: 50), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 50), duration: (1/3))
        getSprite().run(moveText)
    }
}

class AddBallTextBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 57)
        color.size.width = 100
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
        let moveBlue = SKAction.move(to: CGPoint(x: 80, y: 57), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 80, y: -(Dimensions().screenHeight()) + 57), duration: (1/3))
        getSprite().run(moveBlue)
    }
    func addTouched(addBallBG: AddBallTextBackground, fingerPosition: CGPoint, blue: Shape, env: GameScene, scoreLabel: Label, addBallCost: AddBallCost) {
        
        if addBallBG.getSprite().contains(fingerPosition) && env.score >= env.ballCost {
            let copiedNode = blue.getSprite().copy() as! SKSpriteNode
            
            let randX = Int(arc4random_uniform(120))
            let randY = Int(arc4random_uniform(300))
            
            copiedNode.position = CGPoint(x: randX, y: randY)
            env.addChild(copiedNode)
            env.nodeArray.append(copiedNode)
            UserDefaults.standard.set(env.nodeArray.count, forKey: "array")
            
            env.score -= env.ballCost
            env.ballCost += 20
            env.ballLevel += 1
            
            scoreLabel.getSprite().text = String(env.score)
            addBallCost.getSprite().text = "Cost: \(env.ballCost)"
            
            UserDefaults.standard.set(env.score, forKey: "score")
            UserDefaults.standard.set(env.ballCost, forKey: "ballCost")
            UserDefaults.standard.set(env.ballLevel, forKey: "ballLevel")
        }
    }
}

class AddBallText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "Add Ball")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.position = CGPoint(x: -97, y: -(Dimensions().screenHeight() + 50))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -97, y: 50), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -97, y: -(Dimensions().screenHeight()) + 50), duration: (1/4))
        getSprite().run(move)
    }
}
