//
//  GameScene.swift
//  Collisions
//
//  Created by 90303107 on 1/7/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var nodeArray = [SKSpriteNode]()
    var cornerArray = [SKSpriteNode]()

    var count = 0
    var score = 0
    var boolean = false
    var ballArray = 1
    var checkBallShop = false
    var color = ""
    var greenBought = false
    var whiteBought = false
    var firstTime = 0
    var firstTimeBool = true
    
    var startBG = "white"
    var blackBGPurchase = false
    
    var blue = Shape(img: "light")
    let quantum = World()
    let either = Dimensions()
    let explain = Explanation()
    let arrow = Arrows()
    let box = Box()
    let ok = OkButton()
    
    // boarders
    let leftBoarder = Left()
    let rightBoarder = Right()
    let topBoarder = Top()
    let bottomBoarder = Bottom()
    
    // corners
    let topLeft = One()
    let topRight = Two()
    let bottomLeft = Three()
    let bottomRight = Four()
    
    // score
    let scoreLabel = Label()
    
    // shop
    let shopButton = ShopButton()
    let shop = Shop()
    let close = Symbol()
    
    // reset
    let resetButton = Reset()
    
    // background
    let black = Background()
    
    // buttons
    let speedText = SpeedText(cost: 5)
    let speedTextBG = SpeedTextBackground()
    let addSpeed = AddSpeed()
    let addBallCost = AddBallCost(cost: 20)
    let addBallBG = AddBallTextBackground()
    let addBallText = AddBallText()
    
    // balls
    let ballButton = BallButton()
    let ballShop = BallShop()
    
    // buy balls
    let blueBallText = BlueBallText()
    let blueBallBG = BlueBallBackground()
    let blueBallCost = BlueBallCost(txt: "Selected")
    let greenBallText = GreenBallText()
    let greenBallBG = GreenBallBackground()
    let greenBallCost = GreenBallCost(cost: 500)
    let whiteBallText = WhiteBallText()
    let whiteBallBG = WhiteBallBackground()
    let whiteBallCost = WhiteBallCost(cost: 20000)
    
    // backgrounds
    let whiteBG = WhiteBackground()
    let whiteBGCost = WhiteBackgroundCost()
    let whiteBGText = WhiteBackgroundText()
    let blackBG = BlackBackground()
    let blackBGCost = BlackBackgroundCost(cost: 5000)
    let blackBGText = BlackBackgroundText()
    
    // upgrade costs
    var speedCost = 5
    var speedLevel = 1
    var ballCost = 20
    var ballLevel = 1
    
    override func didMove(to view: SKView) {
        
        scene?.scaleMode = SKSceneScaleMode.resizeFill
        
        // gets the stored variables
        quantum.getStored(env: self, scoreLabel: scoreLabel, speedText: speedText, addBallCost: addBallCost)
        
        // checks background color
        quantum.checkBackground(env: self, blackBGCost: blackBGCost, box: box)
        
        // add ball
        blue.add(environment: self)
        nodeArray.append(blue.getSprite())
        
        // add boarders
        leftBoarder.add(env: self)
        rightBoarder.add(env: self)
        topBoarder.add(env: self)
        bottomBoarder.add(env: self)
        
        // add score
        scoreLabel.add(env: self)
        blue.physicsBody()
        
        // add shop
        shopButton.add(env: self)
        shop.add(env: self)
        close.add(env: self)
        
        // add upgrades
        speedText.add(env: self)
        speedTextBG.add(env: self)
        addSpeed.add(env: self)
        addBallCost.add(env: self)
        addBallBG.add(env: self)
        addBallText.add(env: self)
        
        // add ball shop
        ballButton.add(env: self)
        ballShop.add(env: self)
        blueBallBG.add(env: self)
        blueBallCost.add(env: self)
        blueBallText.add(env: self)
        greenBallBG.add(env: self)
        greenBallCost.add(env: self)
        greenBallText.add(env: self)
        whiteBallBG.add(env: self)
        whiteBallCost.add(env: self)
        whiteBallText.add(env: self)
        
        // add corners
        topLeft.add(env: self)
        topRight.add(env: self)
        bottomLeft.add(env: self)
        bottomRight.add(env: self)
        cornerArray.append(topLeft.getSprite())
        cornerArray.append(topRight.getSprite())
        cornerArray.append(bottomLeft.getSprite())
        cornerArray.append(bottomRight.getSprite())
        
        // add middle box
        box.add(env: self)
        
        // add add background stuff
        blackBG.add(env: self)
        blackBGCost.add(env: self)
        blackBGText.add(env: self)
        whiteBG.add(env: self)
        whiteBGCost.add(env: self)
        whiteBGText.add(env: self)

        // add physics bodies
        leftBoarder.physicsBody()
        rightBoarder.physicsBody()
        topBoarder.physicsBody()
        bottomBoarder.physicsBody()
        topLeft.physicsBody()
        topRight.physicsBody()
        bottomLeft.physicsBody()
        bottomRight.physicsBody()
        
        // gravity
        quantum.gravityOff(thing: blue.getSprite())
        
        // add masks
        blue.getSprite().physicsBody?.categoryBitMask = PhysicsCategories.Player
        blue.getSprite().physicsBody?.collisionBitMask = 6
        
        topLeft.getSprite().physicsBody?.categoryBitMask = PhysicsCategories.TopLeft
        topLeft.getSprite().physicsBody?.contactTestBitMask = PhysicsCategories.Player
        topLeft.getSprite().physicsBody?.collisionBitMask = 0
        
        topRight.getSprite().physicsBody?.categoryBitMask = PhysicsCategories.TopRight
        topRight.getSprite().physicsBody?.contactTestBitMask = PhysicsCategories.Player
        topRight.getSprite().physicsBody?.collisionBitMask = 0
        
        bottomLeft.getSprite().physicsBody?.categoryBitMask = PhysicsCategories.BottomLeft
        bottomLeft.getSprite().physicsBody?.contactTestBitMask = PhysicsCategories.Player
        bottomLeft.getSprite().physicsBody?.collisionBitMask = 0
        
        bottomRight.getSprite().physicsBody?.categoryBitMask = PhysicsCategories.BottomRight
        bottomRight.getSprite().physicsBody?.contactTestBitMask = PhysicsCategories.Player
        bottomRight.getSprite().physicsBody?.collisionBitMask = 0
        
        physicsWorld.contactDelegate = self

        // checks if green is selected
        greenBallCost.checkIfSelected(env: self, greenBallCost: greenBallCost)

        // checks if white is selected
        whiteBallCost.checkIfSelected(env: self, whiteBallCost: whiteBallCost)
        
        // add balls when game starts
        quantum.addBalls(env: self, blue: blue, quantum: quantum)
        
        // impulse on sprite
        quantum.impulse(thing: blue.getSprite(), level: speedLevel)
        
        // tutorial
        quantum.tutorial(env: self, explain: explain, black: black, arrow: arrow, box: box)
        
        // checks ball color
        whiteBallBG.checkBallColor(env: self, blueBallCost: blueBallCost, whiteBallCost: whiteBallCost, greenBallCost: greenBallCost, blackBGCost: blackBGCost, whiteBGCost: whiteBGCost, scoreLabel: scoreLabel)

    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        
        if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask){
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        }else{
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.TopLeft != 0)) {
            // Top Left
            
            score += 1
            scoreLabel.getSprite().text = String(score)
            UserDefaults.standard.set(score, forKey: "score")
            UserDefaults.standard.set(scoreLabel.getSprite().text, forKey: "StringScore")
        }
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.TopRight != 0)) {
            // Top Right
            
            score += 1
            scoreLabel.getSprite().text = String(score)
            UserDefaults.standard.set(score, forKey: "score")
            UserDefaults.standard.set(scoreLabel.getSprite().text, forKey: "StringScore")
        }
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.BottomLeft != 0)) {
            // Bottom Left
            
            score += 1
            scoreLabel.getSprite().text = String(score)
            UserDefaults.standard.set(score, forKey: "score")
            UserDefaults.standard.set(scoreLabel.getSprite().text, forKey: "StringScore")
        }
        if((firstBody.categoryBitMask & PhysicsCategories.Player != 0) && (secondBody.categoryBitMask & PhysicsCategories.BottomRight != 0)) {
            // Bottom Right
            
            score += 1
            scoreLabel.getSprite().text = String(score)
            UserDefaults.standard.set(score, forKey: "score")
            UserDefaults.standard.set(scoreLabel.getSprite().text, forKey: "StringScore")
        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let fingerPosition = touch.location(in: self)
            
            // checks first time
            quantum.checkFirstTime(env: self, black: black, explain: explain, arrow: arrow, box: box, fingerPosition: fingerPosition, close: close, shopButton: shopButton, ballButton: ballButton, ok: ok)
            
            var vcount = 0
            
            while vcount < nodeArray.count {
            
                speedTextBG.touched(fingerPosition: fingerPosition, env: self, speedTextBG: speedTextBG, blue: nodeArray[vcount], veloX: (nodeArray[vcount].physicsBody?.velocity.dx)!, veloY: (nodeArray[vcount].physicsBody?.velocity.dy)!, scoreLabel: scoreLabel, speedText: speedText, nodeArray: nodeArray, count: vcount)
                vcount += 1
            }
            
            // if add ball button is clicked
            addBallBG.addTouched(addBallBG: addBallBG, fingerPosition: fingerPosition, blue: blue, env: self, scoreLabel: scoreLabel, addBallCost: addBallCost)
            
            // if shop button is clicked
            shopButton.moveSprites(shopButton: shopButton, close: close, shop: shop, speedText: speedText, speedTextBG: speedTextBG, addSpeed: addSpeed, addBallCost: addBallCost, addBallBG: addBallBG, addBallText: addBallText, black: black, env: self, boolean: boolean, fingerPosition: fingerPosition, greenBallText: greenBallText, greenBallCost: greenBallCost, greenBallBG: greenBallBG, check: checkBallShop)
            
            // if the "x" symbol is clicked
            close.moveSpritesBack(close: close, shop: shop, speedText: speedText, speedTextBG: speedTextBG, addSpeed: addSpeed, addBallCost: addBallCost, addBallBG: addBallBG, addBallText: addBallText, black: black, env: self, boolean: boolean, fingerPosition: fingerPosition, greenBallText: greenBallText, greenBallCost: greenBallCost, greenBallBG: greenBallBG, ballShop: ballShop, blueBallText: blueBallText, blueBallBG: blueBallBG, blueBallCost: blueBallCost, whiteBallCost: whiteBallCost, whiteBallText: whiteBallText, whiteBallBG: whiteBallBG, blackBGCost: blackBGCost, blackBGText: blackBGText, blackBG: blackBG, whiteBGCost: whiteBGCost, whiteBGText: whiteBGText, whiteBG: whiteBG)
            
            // reset button
            //resetButton.button(resetButton: resetButton, nodeArray: nodeArray, env: self, scoreLabel: scoreLabel, blue: blue, fingerPosition: fingerPosition)
            
            //
            ballButton.buttonTouched(env: self, ballShop: ballShop, close: close, greenBallText: greenBallText, greenBallCost: greenBallCost, greenBallBG: greenBallBG, ballButton: ballButton, black: black, blueBallCost: blueBallCost, blueBallBG: blueBallBG, blueBallText: blueBallText, whiteBallCost: whiteBallCost, whiteBallText: whiteBallText, whiteBallBG: whiteBallBG, blackBGCost: blackBGCost, blackBGText: blackBGText, blackBG: blackBG, whiteBGCost: whiteBGCost, whiteBGText: whiteBGText, whiteBG: whiteBG, fingerPosition: fingerPosition, boolean: boolean)
            
            blackBG.touched(env: self, blackBG: blackBG, score: scoreLabel, whiteBGCost: whiteBGCost, blackBGCost: blackBGCost, fingerPosition: fingerPosition, box: box, scoreLabel: scoreLabel)
            
            whiteBG.touched(env: self, whiteBG: whiteBG, score: scoreLabel, whiteBGCost: whiteBGCost, blackBGCost: blackBGCost, fingerPosition: fingerPosition, box: box)
            
            blueBallBG.touched(env: self, blueBallBG: blueBallBG, blueBallCost: blueBallCost, greenBallCost: greenBallCost, whiteBallCost: whiteBallCost, fingerPosition: fingerPosition)
            
            greenBallBG.touched(env: self, greenBallBG: greenBallBG, blueBallCost: blueBallCost, whiteBallCost: whiteBallCost, scoreLabel: scoreLabel, greenBallCost: greenBallCost, fingerPosition: fingerPosition)
            
            whiteBallBG.touched(whiteBallBG: whiteBallBG, blueBallCost: blueBallCost, scoreLabel: scoreLabel, whiteBallCost: whiteBallCost, greenBallCost: greenBallCost, env: self, fingerPosition: fingerPosition)
            
            quantum.changeDirection(ballButton: ballButton, shopButton: shopButton, close: close, env: self, fingerPosition: fingerPosition)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
