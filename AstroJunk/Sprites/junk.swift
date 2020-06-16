//
//  junk.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/9/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

enum JunkType: String, CaseIterable {
    case redWing = "wingRed"
    case greenWing = "wingGreen"
    case beam = "beam"
}

class Junk: SKSpriteNode{
    
    init(){
        let randomTexture = JunkType.allCases.randomElement()!
        let texture = SKTexture(imageNamed: randomTexture.rawValue)
        let color = UIColor.clear
        var size = CGSize(width: 25, height: 25)
        if randomTexture.rawValue == "beam"{
            size = CGSize(width: 20, height: 20)
        }
        
        super.init(texture: texture, color: color, size: size)
        self.name = "junk"
        self.zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveJunk(scene: SKScene){
        if let view = scene.view{
            position.x = CGFloat.random(in: 0...view.bounds.width)
            position.y = view.bounds.height
        }
        let turn1 = SKAction.rotate(byAngle: 2, duration: 1)
        let turn2 = SKAction.rotate(byAngle: -2, duration: 1)
        let turning = SKAction.sequence([turn1,turn2])
        let repetition = SKAction.repeatForever(turning)
        
        let going = SKAction.move(to: CGPoint(x: CGFloat.random(in: 0...frame.size.width), y: -10), duration: 8)
        let ending = SKAction.removeFromParent()
        let repetition2 = SKAction.sequence([going,ending])
        let traverse = SKAction.group([repetition,repetition2])
        self.run(traverse)
    }
    
}
