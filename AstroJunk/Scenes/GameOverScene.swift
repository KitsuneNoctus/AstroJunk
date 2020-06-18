//
//  GameOverScene.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/11/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    
    let overLabel = SKLabelNode()
    let scoreLabel = SKLabelNode()
    
    let screen = SKAction.playSoundFileNamed("scifiUI1.mp3", waitForCompletion: true)
    
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
        let space = SKSpriteNode(imageNamed: "space_background")
        space.size = UIScreen.main.bounds.size
        space.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        self.addChild(space)
        createButton()
    }
    
    func createLabels(){
        
    }
    
    func createButton(){
        //Button
        let buttonTexture = SKTexture(imageNamed: "button")
        let buttonSelected = SKTexture(imageNamed: "button2")
        
        let button = ButtonNode(normalTexture: buttonTexture, selectedTexture: buttonSelected, disabledTexture: buttonTexture)
        button.setButtonAction(target: self, triggerEvent: .TouchUpInside, action: #selector(GameOverScene.buttonTap))
        button.setButtonLabel(title: "Play Again", font: "Helvetica", fontSize: 20)
        button.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        button.zPosition = 2
        button.name = "button"
        self.addChild(button)
    }
    
    @objc func buttonTap(){
        let gameScene = GameScene(size: (self.view?.bounds.size)!)
        self.run(screen)
        
//        let audioNode = SKAudioNode(fileNamed: "scifiUI1.mp3")
//        audioNode.isPositional = false
//        self.addChild(audioNode)
//        audioNode.run(SKAction.play())
        
        gameScene.scaleMode = .aspectFill
        let crossFade = SKTransition.crossFade(withDuration: 0.75)
        if let spriteview = self.view{
            spriteview.presentScene(gameScene, transition: crossFade)
        }
        //        view?.presentScene(gameOverScene, transition: crossFade)
    }
}
