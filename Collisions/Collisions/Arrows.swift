//
//  Arrows.swift
//  Collisions
//
//  Created by 90303107 on 2/5/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Arrows {
    private var arrow: SKSpriteNode
    
    init() {
        arrow = SKSpriteNode(imageNamed: "arrows")
        arrow.position = CGPoint(x: 0, y: 0)
        arrow.size.width = Dimensions().screenWidth()
        arrow.size.height = Dimensions().screenHeight()
        arrow.zPosition = 0
    }
    
    func add(env: GameScene) {
        env.addChild(arrow)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.arrow
    }
}

class Box {
    private var box: SKSpriteNode
    
    init() {
        box = SKSpriteNode(imageNamed: "box")
        box.position = CGPoint(x: 0, y: 0)
        box.size.width = 80
        box.size.height = 80
        box.zPosition = 0
    }
    
    func add(env: GameScene) {
        env.addChild(box)
    }
    
    func getSprite() -> SKSpriteNode {
        return self.box
    }
}
