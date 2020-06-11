//
//  GameOverScene.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/11/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    override init(size: CGSize) {
        // do initial configuration work here
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    override func didMove(to view: SKView) {
        /*
         Use this method to implement any custom behavior for
         your scene when it is about to be presented by a view.
         For example, you might use this method to create the scene’s contents.
         */
//        let gameOver =
    }
}
