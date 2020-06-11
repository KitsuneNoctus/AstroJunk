//
//  ship.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/9/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class Ship: SKSpriteNode{
    
    init() {
        let texture = SKTexture(imageNamed: "playerShip")
        let color = UIColor.clear
        let size = CGSize(width: 44, height: 44)
        super.init(texture: texture, color: color, size: size)
        self.name = "ship"
        self.zPosition = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
