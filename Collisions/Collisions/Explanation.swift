//
//  Explanation.swift
//  Collisions
//
//  Created by 90303107 on 1/23/2562 BE.
//  Copyright © 2562 BE 90303107. All rights reserved.
//

import UIKit
import SpriteKit

class Explanation {
    private var text: SKLabelNode
    
    init() {
        text = SKLabelNode(text: "Tap to move the ball")
        text.position = CGPoint(x: 0, y: 55)
        text.fontName = "HelveticaNeue-Light"
        text.fontSize = 27
        text.numberOfLines = 0
        text.preferredMaxLayoutWidth = 300
        text.fontColor = UIColor.black
        text.zPosition = 100
    }
    
    func add(env: GameScene) {
        env.addChild(text)
    }
    
    func getSprite() -> SKLabelNode {
        return self.text
    }
}

class OkButton {
    private var ok: SKLabelNode
    
    init() {
        ok = SKLabelNode(text: "Ok")
        ok.fontSize = 27
        ok.fontName = "HelveticaNeue-Light"
        ok.fontColor = UIColor.black
        ok.position = CGPoint(x: 0, y: -125)
    }
    
    func add(env: GameScene) {
        env.addChild(ok)
    }
    
    func getSprite() -> SKLabelNode {
        return self.ok
    }
}
