//
//  GreenBall.swift
//  Collisions
//
//  Created by 90303107 on 1/20/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class BlueBallCost {
    private var text: SKLabelNode
    
    init(txt: String) {
        text = SKLabelNode(text: txt)
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 125)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: 145), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 125), duration: (1/3))
        getSprite().run(moveText)
    }
}

class BlueBallBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 132)
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
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: 152), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 132), duration: (1/3))
        getSprite().run(moveBlue)
    }
    
    func touched(env: GameScene, blueBallBG: BlueBallBackground, blueBallCost: BlueBallCost, greenBallCost: GreenBallCost, whiteBallCost: WhiteBallCost, fingerPosition: CGPoint) {
        if blueBallBG.getSprite().contains(fingerPosition) && env.color != "light" {
            blueBallCost.getSprite().text = "Selected"
            var count = env.nodeArray.count
            while count > 0 {
                env.nodeArray[count - 1].texture = SKTexture(imageNamed: "light")
                count -= 1
            }
            env.color = "light"
            UserDefaults.standard.set(env.color, forKey: "color")
            
            if env.greenBought == true {
                greenBallCost.getSprite().text = "Select"
            }
            
            if env.whiteBought == true {
                whiteBallCost.getSprite().text = "Select"
            }
        }
    }
}

class BlueBallText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "Blue Ball")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.position = CGPoint(x: -90, y: -(Dimensions().screenHeight() + 125))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -90, y: 145), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -90, y: -(Dimensions().screenHeight()) + 125), duration: (1/4))
        getSprite().run(move)
    }
}

///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

class GreenBallCost {
    private var text: SKLabelNode
    
    init(cost: Int) {
        text = SKLabelNode(text: "Cost: \(cost)")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 50)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: 70), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 50), duration: (1/3))
        getSprite().run(moveText)
    }
    
    func checkIfSelected(env: GameScene, greenBallCost: GreenBallCost) {
        if env.greenBought {
            greenBallCost.getSprite().text = "Select"
        }
    }
}

class GreenBallBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 57)
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
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: 77), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) + 57), duration: (1/3))
        getSprite().run(moveBlue)
    }
    
    func touched(env: GameScene, greenBallBG: GreenBallBackground, blueBallCost: BlueBallCost, whiteBallCost: WhiteBallCost, scoreLabel: Label, greenBallCost: GreenBallCost, fingerPosition: CGPoint) {
        if (greenBallBG.getSprite().contains(fingerPosition) && env.score >= 500) || (greenBallBG.getSprite().contains(fingerPosition) && env.greenBought == true) {
            
            blueBallCost.getSprite().text = "Select"
            
            if env.whiteBought == true {
                whiteBallCost.getSprite().text = "Select"
            }
            
            var count = env.nodeArray.count
            
            while count > 0 {
                env.nodeArray[count - 1].texture = SKTexture(imageNamed: "greenBall")
                count -= 1
            }
            env.color = "greenBall"
            UserDefaults.standard.set(env.color, forKey: "color")
            
            if env.greenBought == true {
                
            } else {
                env.score -= 500
                scoreLabel.getSprite().text = String(env.score)
                UserDefaults.standard.set(env.score, forKey: "score")
                
            }
            
            env.greenBought = true
            UserDefaults.standard.set(env.greenBought, forKey: "greenBought")
            
            greenBallCost.getSprite().text = "Selected"
        }
    }
}

class GreenBallText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "Green Ball")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.position = CGPoint(x: -84, y: -(Dimensions().screenHeight() + 50))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -84, y: 70), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -84, y: -(Dimensions().screenHeight()) + 50), duration: (1/4))
        getSprite().run(move)
    }
}

///////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////

class WhiteBallCost {
    private var text: SKLabelNode
    
    init(cost: Int) {
        text = SKLabelNode(text: "Cost: \(cost)")
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 20
        text.fontColor = UIColor.black
        text.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 25)
        text.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
    
    func move() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -5), duration: (1/4))
        getSprite().run(moveText)
    }
    
    func moveBack() {
        let moveText = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 25), duration: (1/3))
        getSprite().run(moveText)
    }
    
    func checkIfSelected(env: GameScene, whiteBallCost: WhiteBallCost) {
        if env.whiteBought {
            whiteBallCost.getSprite().text = "Select"
        }
    }
}

class WhiteBallBackground {
    private var color: SKSpriteNode
    
    init() {
        color = SKSpriteNode(imageNamed: "BlueButton")
        color.position = CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 18)
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
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: 2), duration: (1/4))
        getSprite().run(moveBlue)
    }
    
    func moveBack() {
        let moveBlue = SKAction.move(to: CGPoint(x: 75, y: -(Dimensions().screenHeight()) - 18), duration: (1/3))
        getSprite().run(moveBlue)
    }
    
    func touched(whiteBallBG: WhiteBallBackground, blueBallCost: BlueBallCost, scoreLabel: Label, whiteBallCost: WhiteBallCost, greenBallCost: GreenBallCost, env: GameScene, fingerPosition: CGPoint) {
        if (whiteBallBG.getSprite().contains(fingerPosition) && env.score >= 20000) || (whiteBallBG.getSprite().contains(fingerPosition) && env.whiteBought == true) {
            
            blueBallCost.getSprite().text = "Select"
            
            if env.greenBought == true {
                greenBallCost.getSprite().text = "Select"
            }
            
            var count = env.nodeArray.count
            
            while count > 0 {
                env.nodeArray[count - 1].texture = SKTexture(imageNamed: "whiteBall")
                count -= 1
            }
            env.color = "whiteBall"
            UserDefaults.standard.set(env.color, forKey: "color")
            
            if env.whiteBought == true {
                
            } else {
                env.score -= 20000
                scoreLabel.getSprite().text = String(env.score)
                UserDefaults.standard.set(env.score, forKey: "score")
                
            }
            
            env.whiteBought = true
            UserDefaults.standard.set(env.whiteBought, forKey: "whiteBought")
            
            whiteBallCost.getSprite().text = "Selected"
        }
    }
    
    func checkBallColor(env: GameScene, blueBallCost: BlueBallCost, whiteBallCost: WhiteBallCost, greenBallCost: GreenBallCost, blackBGCost: BlackBackgroundCost, whiteBGCost: WhiteBackgroundCost, scoreLabel: Label) {
        if env.color == "greenBall"
        {
            blueBallCost.getSprite().text = "Select"
            
            var count = env.nodeArray.count
            
            while count > 0 {
                env.nodeArray[count - 1].texture = SKTexture(imageNamed: "greenBall")
                count -= 1
            }
            env.color = "greenBall"
            UserDefaults.standard.set(env.color, forKey: "color")
            
            if env.whiteBought == true {
                whiteBallCost.getSprite().text = "Select"
            }
            
            greenBallCost.getSprite().text = "Selected"
        }
        else if env.color == "whiteBall"
        {
            blueBallCost.getSprite().text = "Select"
            var count = env.nodeArray.count
            while count > 0 {
                env.nodeArray[count - 1].texture = SKTexture(imageNamed: "whiteBall")
                count -= 1
            }
            env.color = "whiteBall"
            UserDefaults.standard.set(env.color, forKey: "color")
            
            if env.greenBought == true {
                greenBallCost.getSprite().text = "Select"
            }
            whiteBallCost.getSprite().text = "Selected"
        }
        
        if env.startBG == "black" {
            blackBGCost.getSprite().text = "Selected"
            whiteBGCost.getSprite().text = "Select"
            scoreLabel.getSprite().fontColor = UIColor.white
            var tcount = env.cornerArray.count
            while tcount > 0 {
                env.cornerArray[tcount - 1].texture = SKTexture(imageNamed: "black")
                tcount -= 1
            }
        }
    }
}

class WhiteBallText {
    private var add: SKLabelNode
    
    init() {
        add = SKLabelNode(text: "White Ball")
        add.fontName = "HelveticaNeue-Light"
        add.fontSize = 20
        add.fontColor = UIColor.black
        add.position = CGPoint(x: -85, y: -(Dimensions().screenHeight() - 25))
        add.zPosition = 10
    }
    
    func add(env: GameScene) {
        env.addChild(add)
    }
    
    func getSprite() -> SKLabelNode {
        return self.add
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: -84, y: -5), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: -84, y: -(Dimensions().screenHeight()) - 25), duration: (1/4))
        getSprite().run(move)
    }
}
