//
//  Meteor.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/9/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit
enum MeteorType: String, CaseIterable{
    case greyBig = "meteorGrey_big"
    case greyMed = "meteorGrey_med"
    case brownBig = "meteorBrown_big"
}
class Meteor: SKSpriteNode{
    
    init(){
        let randomTexture = MeteorType.allCases.randomElement()!
        let texture = SKTexture(imageNamed: randomTexture.rawValue)
        let color = UIColor.clear
        let size = CGSize(width: 30, height: 30)
        super.init(texture: texture, color: color, size: size)
        self.name = "meteor"
        self.zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
