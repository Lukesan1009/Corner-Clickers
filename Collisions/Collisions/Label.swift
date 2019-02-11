//
//  Label.swift
//  Collisions
//
//  Created by 90303107 on 1/13/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Label {
    private var score: SKLabelNode
    
    init() {
        score = SKLabelNode(text: "0")
        score.fontName = "HelveticaNeue-Light"
        score.position = CGPoint(x: 0, y: (Dimensions().screenHeight() / 2) - 100)
        score.fontSize = 30
        score.zPosition = 3
        score.fontColor = UIColor.black
    }
    
    func add(env: GameScene) {
        env.addChild(score)
    }
    
    func getSprite() -> SKLabelNode {
        return self.score
    }
    
}
