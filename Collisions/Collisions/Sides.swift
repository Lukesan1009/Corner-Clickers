//
//  Sides.swift
//  Collisions
//
//  Created by 90303107 on 1/11/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Top {
    private var wall: SKSpriteNode
    
    init() {
        wall = SKSpriteNode(imageNamed: "blue")
        wall.size.width = Dimensions().screenWidth()
        wall.size.height = 50
        wall.position = CGPoint(x: 0, y: (Dimensions().screenHeight() / 2) + 25)
    }
    
    func add(env: GameScene) {
        env.addChild(wall)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.wall
    }
    
    func physicsBody() {
        wall.physicsBody = SKPhysicsBody(texture: wall.texture!, size: wall.size)
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0
        wall.physicsBody?.friction = 0
        wall.physicsBody?.linearDamping = 0
        wall.physicsBody?.angularDamping = 0
    }
}

class Bottom {
    private var wall: SKSpriteNode
    
    init() {
        wall = SKSpriteNode(imageNamed: "blue")
        wall.size.width = Dimensions().screenWidth()
        wall.size.height = 50
        wall.position = CGPoint(x: 0, y: -(Dimensions().screenHeight() / 2) - 25)
    }
    
    func add(env: GameScene) {
        env.addChild(wall)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.wall
    }
    
    func physicsBody() {
        wall.physicsBody = SKPhysicsBody(texture: wall.texture!, size: wall.size)
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0
        wall.physicsBody?.friction = 0
        wall.physicsBody?.linearDamping = 0
        wall.physicsBody?.angularDamping = 0
    }
}

class Left {
    private var wall: SKSpriteNode
    
    init() {
        wall = SKSpriteNode(imageNamed: "blue")
        wall.size.width = 50
        wall.size.height = Dimensions().screenHeight()
        wall.position = CGPoint(x: -(Dimensions().screenWidth() / 2) - 25, y: 0)
    }
    
    func add(env: GameScene) {
        env.addChild(wall)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.wall
    }
    
    func physicsBody() {
        wall.physicsBody = SKPhysicsBody(texture: wall.texture!, size: wall.size)
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0
        wall.physicsBody?.friction = 0
        wall.physicsBody?.linearDamping = 0
        wall.physicsBody?.angularDamping = 0
    }
}

class Right {
    private var wall: SKSpriteNode
    
    init() {
        wall = SKSpriteNode(imageNamed: "blue")
        wall.size.width = 50
        wall.size.height = Dimensions().screenHeight()
        wall.position = CGPoint(x: Dimensions().screenWidth() / 2 + 25, y: 0)
    }
    
    func add(env: GameScene) {
        env.addChild(wall)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.wall
    }
    
    func physicsBody() {
        wall.physicsBody = SKPhysicsBody(texture: wall.texture!, size: wall.size)
        wall.physicsBody?.isDynamic = false
        wall.physicsBody?.restitution = 0
        wall.physicsBody?.friction = 0
        wall.physicsBody?.linearDamping = 0
        wall.physicsBody?.angularDamping = 0
    }
}
