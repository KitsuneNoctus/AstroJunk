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
        let randomTexture =
        let texture
        let color
        let size
        super.init(texture: texture, color: color, size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
