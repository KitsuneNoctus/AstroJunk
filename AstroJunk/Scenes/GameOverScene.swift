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
        let buttonTexture = SKTexture(imageNamed: "button")
        let buttonSelected = SKTexture(imageNamed: "button2")
        
        let button = ButtonNode(normalTexture: buttonTexture, selectedTexture: buttonSelected, disabledTexture: buttonTexture)
        button.setButtonAction(target: self, triggerEvent: .TouchUpInside, action: #selector(GameOverScene.buttonTap))
        button.setButtonLabel(title: "Play Again", font: "Helvetica", fontSize: 20)
        button.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
    }
    
    @objc func buttonTap(){
        
    }
}
