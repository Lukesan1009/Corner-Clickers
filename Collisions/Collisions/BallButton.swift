//
//  BallButton.swift
//  Collisions
//
//  Created by 90303107 on 1/19/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class BallButton {
    private var button: SKSpriteNode
    
    init() {
        button = SKSpriteNode(imageNamed: "customizeButton")
        button.position = CGPoint(x: 85, y: -(Dimensions().screenHeight() / 2) + 60)
        button.size.width = 160
        button.size.height = 60
        button.zPosition = 2
    }
    
    func add(env: GameScene) {
        env.addChild(button)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.button
    }
    
    func buttonTouched(env: GameScene, ballShop: BallShop, close: Symbol, greenBallText: GreenBallText, greenBallCost: GreenBallCost, greenBallBG: GreenBallBackground, ballButton: BallButton, black: Background, blueBallCost: BlueBallCost, blueBallBG: BlueBallBackground, blueBallText: BlueBallText, whiteBallCost: WhiteBallCost, whiteBallText: WhiteBallText, whiteBallBG: WhiteBallBackground, blackBGCost: BlackBackgroundCost, blackBGText: BlackBackgroundText, blackBG: BlackBackground, whiteBGCost: WhiteBackgroundCost, whiteBGText: WhiteBackgroundText, whiteBG: WhiteBackground, fingerPosition: CGPoint, boolean: Bool) {
        if ballButton.getSprite().contains(fingerPosition) && env.checkBallShop == false && env.firstTimeBool ==  false
        {
            ballShop.move()
            close.move()
            greenBallText.move()
            greenBallCost.move()
            greenBallBG.move()
            blueBallCost.move()
            blueBallBG.move()
            blueBallText.move()
            whiteBallCost.move()
            whiteBallText.move()
            whiteBallBG.move()
            blackBG.move()
            blackBGText.move()
            blackBGCost.move()
            whiteBG.move()
            whiteBGText.move()
            whiteBGCost.move()
            
            env.checkBallShop = true
            
            black.check(boolean1: boolean, env1: env)
        }
    }
}

class BallShop {
    private var shop: SKSpriteNode
    
    init() {
        shop = SKSpriteNode(imageNamed: "customize")
        shop.position = CGPoint(x: 0, y: -(Dimensions().screenHeight()))
        shop.size.width = 300
        shop.size.height = 550
        shop.zPosition = 5
    }
    
    func add(env: GameScene) {
        env.addChild(shop)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.shop
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: 0, y: 15), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: 0, y: -(Dimensions().screenHeight())), duration: (1/3))
        getSprite().run(move)
    }
    
    
}
