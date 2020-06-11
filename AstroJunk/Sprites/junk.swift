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
    
}
