//
//  Shop.swift
//  Collisions
//
//  Created by 90303107 on 1/14/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Shop {
    private var shop: SKSpriteNode
    
    init() {
        shop = SKSpriteNode(imageNamed: "EmptyShop")
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
        let move = SKAction.move(to: CGPoint(x: 0, y: 0), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: 0, y: -(Dimensions().screenHeight())), duration: (1/3))
        getSprite().run(move)
    }
}

class ShopButton {
    private var shop: SKSpriteNode
    
    init() {
        shop = SKSpriteNode(imageNamed: "shopButton")
        shop.position = CGPoint(x: -85, y: -(Dimensions().screenHeight() / 2) + 60)
        shop.size.width = 140
        shop.size.height = 60
        shop.zPosition = 2
    }
    
    func add(env: GameScene) {
        env.addChild(shop)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.shop
    }
    
    func moveSprites(shopButton: ShopButton, close: Symbol, shop: Shop, speedText: SpeedText, speedTextBG: SpeedTextBackground, addSpeed: AddSpeed, addBallCost: AddBallCost, addBallBG: AddBallTextBackground, addBallText: AddBallText, black: Background, env: GameScene, boolean: Bool, fingerPosition: CGPoint, greenBallText: GreenBallText, greenBallCost: GreenBallCost, greenBallBG: GreenBallBackground, check: Bool) {
        
        if shopButton.getSprite().contains(fingerPosition) && check == false && env.firstTimeBool == false {
            

            
            shop.move()
            close.move()
            speedText.move()
            speedTextBG.move()
            addSpeed.move()
            addBallCost.move()
            addBallBG.move()
            addBallText.move()


            env.checkBallShop = true
            black.check(boolean1: boolean, env1: env)
        }
    }
}

class Symbol {
    private var x: SKSpriteNode
    
    init() {
        x = SKSpriteNode(imageNamed: "close")
        x.position = CGPoint(x: 130, y: -(Dimensions().screenHeight()) + 235)
        x.size.width = 20
        x.size.height = 20
        x.zPosition = 6
    }
    
    func add(env: GameScene) {
        env.addChild(x)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.x
    }
    
    func move() {
        let move = SKAction.move(to: CGPoint(x: 130, y: 235), duration: (1/4))
        getSprite().run(move)
    }
    
    func moveBack() {
        let move = SKAction.move(to: CGPoint(x: 130, y: -(Dimensions().screenHeight()) + 235), duration: (1/3))
        getSprite().run(move)
    }
    
    func moveSpritesBack(close: Symbol, shop: Shop, speedText: SpeedText, speedTextBG: SpeedTextBackground, addSpeed: AddSpeed, addBallCost: AddBallCost, addBallBG: AddBallTextBackground, addBallText: AddBallText, black: Background, env: GameScene, boolean: Bool, fingerPosition: CGPoint, greenBallText: GreenBallText, greenBallCost: GreenBallCost, greenBallBG: GreenBallBackground, ballShop: BallShop, blueBallText: BlueBallText, blueBallBG: BlueBallBackground, blueBallCost: BlueBallCost, whiteBallCost: WhiteBallCost, whiteBallText: WhiteBallText, whiteBallBG: WhiteBallBackground, blackBGCost: BlackBackgroundCost, blackBGText: BlackBackgroundText, blackBG: BlackBackground, whiteBGCost: WhiteBackgroundCost, whiteBGText: WhiteBackgroundText, whiteBG: WhiteBackground) {
        if fingerPosition.x < getSprite().position.x + 30 && fingerPosition.x > getSprite().position.x - 30 && fingerPosition.y < getSprite().position.y + 30 && fingerPosition.y > getSprite().position.y - 25 {
            
            shop.moveBack()
            close.moveBack()
            speedText.moveBack()
            speedTextBG.moveBack()
            addSpeed.moveBack()
            addBallCost.moveBack()
            addBallBG.moveBack()
            addBallText.moveBack()
            greenBallText.moveBack()
            greenBallCost.moveBack()
            greenBallBG.moveBack()
            ballShop.moveBack()
            blueBallText.moveBack()
            blueBallCost.moveBack()
            blueBallBG.moveBack()
            whiteBallText.moveBack()
            whiteBallCost.moveBack()
            whiteBallBG.moveBack()
            blackBG.moveBack()
            blackBGText.moveBack()
            blackBGCost.moveBack()
            whiteBG.moveBack()
            whiteBGText.moveBack()
            whiteBGCost.moveBack()
            
            env.checkBallShop = false
            env.black.getSprite().removeFromParent()
            env.boolean = false
            
        }
        

    }
}
