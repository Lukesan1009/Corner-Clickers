//
//  Shape.swift
//  Collisions
//
//  Created by 90303107 on 1/7/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import SpriteKit
import UIKit

class Shape {
    private var sprite: SKSpriteNode
    
    init(img: String) {
        sprite = SKSpriteNode(imageNamed: img)
        sprite.position = CGPoint(x: 0, y: 200)
        sprite.size.width = 100
        sprite.size.height = 100
        sprite.zPosition = 1
    }
    
    func add(environment: GameScene) {
        environment.addChild(sprite)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.sprite
    }
    
    func physicsBody() {
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        sprite.physicsBody?.restitution = 1
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularDamping = 0
        sprite.physicsBody?.friction = 0
        sprite.physicsBody?.allowsRotation = false
    }
}

class GreenShape {
    private var sprite: SKSpriteNode
    
    init() {
        sprite = SKSpriteNode(imageNamed: "greenBall")
        sprite.position = CGPoint(x: 50, y: -100)
        sprite.size.width = 80
        sprite.size.height = 80
        sprite.zPosition = 101
    }
    
    func add(environment: GameScene) {
        environment.addChild(sprite)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.sprite
    }
    
    func physicsBody() {
        sprite.physicsBody = SKPhysicsBody(circleOfRadius: 50)
        sprite.physicsBody?.restitution = 1
        sprite.physicsBody?.linearDamping = 0
        sprite.physicsBody?.angularDamping = 0
        sprite.physicsBody?.friction = 0
        sprite.physicsBody?.allowsRotation = false
    }
}
