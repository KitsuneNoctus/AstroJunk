//
//  GameScene.swift
//  AstroJunk
//
//  Created by Henry Calderon on 6/4/20.
//  Copyright © 2020 Henry Calderon. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
  
    
    override func didMove(to view: SKView) {
        //MARK: Background
        let space = SKSpriteNode(imageNamed: "space_background")
        space.size = CGSize(width: self.frame.width, height: self.frame.height)
        self.addChild(space)
        createShip()
        createMeteor()
        createBeam()
        createJunk()
        
        
    }
    
    //MARK: Create Ship
    func createShip(){
        let ship = SKSpriteNode(imageNamed: "playerShip")
        ship.size = CGSize(width: 64, height: 64)
        if let view = self.view {
            ship.position = CGPoint(x: view.bounds.width/2, y: view.bounds.height/5)
        }
        
        ship.zPosition = 2
        self.addChild(ship)
        
        //Ship Move
        let moveRight = SKAction.moveTo(x: 300, duration: 5)
        let moveLeft = SKAction.moveTo(x: -300, duration: 5)
        let backNForth = SKAction.sequence([moveRight, moveLeft])
        let alwaysBNF = SKAction.repeatForever(backNForth)
        ship.run(alwaysBNF)
    }
    
    //MARK: Create Meteor
    func createMeteor(){
        //Meteor
        let meteor = SKSpriteNode(imageNamed: "meteorGrey_med1")
        meteor.size = CGSize(width: 40, height: 40)
        meteor.position = CGPoint(x: 200, y: 300)
        meteor.zPosition = 2
        self.addChild(meteor)
        
        //Meteor Move
        let turn = SKAction.rotate(byAngle: 20, duration: 1)
        let spin = SKAction.repeatForever(turn)
        let moveDown = SKAction.move(to: CGPoint(x: 0, y: -700), duration: 4)
        let movement = SKAction.group([spin, moveDown])
        
        //        let meteorEvent = SKAction.sequence([movement, gone])
        meteor.run(movement)
    }
    
    //MARK: Create Beam
    func createBeam(){
        
        let beam = SKSpriteNode(imageNamed: "beam")
        beam.size = CGSize(width: 20, height: 20)
        beam.position = CGPoint(x: 100, y: 500)
        beam.zPosition = 2
        self.addChild(beam)
        
        let moveRight = SKAction.moveTo(x: 300, duration: 5)
        let moveLeft = SKAction.moveTo(x: -300, duration: 5)
        let backNForth = SKAction.sequence([moveRight, moveLeft])
        let alwaysBNF = SKAction.repeatForever(backNForth)
        beam.run(alwaysBNF)
    }
    
    //MARK: Create Junk
    func createJunk(){
        let junk1 = SKSpriteNode(imageNamed: "wingGreen_6")
        junk1.size = CGSize(width: 30, height: 30)
        junk1.position = CGPoint(x: 300, y: 450)
        junk1.zPosition = 2
        self.addChild(junk1)
        
        //Debris Move
        let turn1 = SKAction.rotate(byAngle: 2, duration: 1)
        let turn2 = SKAction.rotate(byAngle: -2, duration: 1)
        let turning = SKAction.sequence([turn1,turn2])
        let repetition = SKAction.repeatForever(turning)
        let going = SKAction.move(to: CGPoint(x: -400, y: -500), duration: 15)
        let ending = SKAction.removeFromParent()
        let repetition2 = SKAction.sequence([going,ending])
        let traverse = SKAction.group([repetition,repetition2])
        junk1.run(traverse)
        
    }
    
    func rotateMovemet(node: SKSpriteNode){
//        node.run(groupAction)
    }
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
//    func touchDown(atPoint pos : CGPoint) {
//
//    }
//
//    func touchMoved(toPoint pos : CGPoint) {
//
//    }
//
//    func touchUp(atPoint pos : CGPoint) {
//
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//    }
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
}
