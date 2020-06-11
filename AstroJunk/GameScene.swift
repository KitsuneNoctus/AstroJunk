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
  
    var ship: SKSpriteNode!
    
    //MARK: Game Loop
    override func didMove(to view: SKView) {
        //MARK: Background
        let space = SKSpriteNode(imageNamed: "space_background")
        space.size = UIScreen.main.bounds.size
        space.position = CGPoint(x: frame.size.width/2, y: frame.size.height/2)
        self.addChild(space)
        createShip()
        createBeam()
        createMeteorAndDebris()
    }
    
    override func didEvaluateActions() {
        checkCollisions()
        checkJunkCollisions()
    }
    
    //MARK: Create Ship
    func createShip(){
        ship = SKSpriteNode(imageNamed: "playerShip")
        ship.name = "ship"
        ship.size = CGSize(width: 44, height: 44)
        ship.position = CGPoint(x: frame.size.width/2, y: frame.size.height/10)
    
        ship.zPosition = 2
        self.addChild(ship)
        
        //Ship Move
        let moveRight = SKAction.moveTo(x: frame.size.width, duration: 3)
        let moveLeft = SKAction.moveTo(x: 0, duration: 3)
        let backNForth = SKAction.sequence([moveRight, moveLeft])
        let alwaysBNF = SKAction.repeatForever(backNForth)
        ship.run(alwaysBNF)
    }
    
    //MARK: Create Meteor
    func createMeteor(){
        //Meteor
        let meteor = SKSpriteNode(imageNamed: "meteorGrey_med1")
        meteor.name = "meteor"
        meteor.size = CGSize(width: 40, height: 40)
//        meteor.position = CGPoint(x: 200, y: 300)
        meteor.position.x = CGFloat.random(in: 0...frame.size.width)
        meteor.position.y = frame.size.height
        meteor.zPosition = 2
        self.addChild(meteor)
        
        //Meteor Move
        let turn = SKAction.rotate(byAngle: 20, duration: 1)
        let spin = SKAction.repeatForever(turn)
        
        let moveDown = SKAction.move(to: CGPoint(x: CGFloat.random(in: 0...frame.size.width), y: -10), duration: 4)
        
        let remove = SKAction.removeFromParent()
        let fall = SKAction.sequence([moveDown,remove])
        let falling = SKAction.group([spin, fall])
        
        //        let meteorEvent = SKAction.sequence([movement, gone])
        meteor.run(falling)
    }
    
    //MARK: Create Beam
    func createBeam(){
        
        let beam = SKSpriteNode(imageNamed: "beam")
        beam.name = "beam"
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
        junk1.name = "junk"
        junk1.size = CGSize(width: 30, height: 30)
//        junk1.position = CGPoint(x: 300, y: 450)
        junk1.position.y = frame.size.height
        junk1.position.x = CGFloat.random(in: 0...frame.size.width)
        junk1.zPosition = 2
        self.addChild(junk1)
        
        //Debris Move
        let turn1 = SKAction.rotate(byAngle: 2, duration: 1)
        let turn2 = SKAction.rotate(byAngle: -2, duration: 1)
        let turning = SKAction.sequence([turn1,turn2])
        let repetition = SKAction.repeatForever(turning)
        
        let going = SKAction.move(to: CGPoint(x: CGFloat.random(in: 0...frame.size.width), y: -10), duration: 8)
        let ending = SKAction.removeFromParent()
        let repetition2 = SKAction.sequence([going,ending])
        let traverse = SKAction.group([repetition,repetition2])
        junk1.run(traverse)
        
    }
    
    func rotateMovemet(node: SKSpriteNode){
//        node.run(groupAction)
    }
    
    //MARK: Create Meteor and Debris
    func createMeteorAndDebris(){
        let wait = SKAction.wait(forDuration: 2)
        let createObject = SKAction.run{
            if Bool.random(){
                self.createJunk()
            }else{
                self.createMeteor()
            }
        }
        let objects = SKAction.sequence([wait,createObject])
        let fallingObjects = SKAction.repeatForever(objects)
        self.run(fallingObjects)
    }
    
    func collision(with: SKSpriteNode){
        with.removeFromParent()
        print("Junk Collision")
    }
    
    func checkCollisions(){
//        var hits: [SKSpriteNode] = []
        self.enumerateChildNodes(withName: "meteor"){ node, _ in
            let meteorNode = node as! SKSpriteNode
            if meteorNode.frame.intersects(self.ship.frame){
                self.ship.removeFromParent()
            }
            
//            for node in hits{
//                self.collision(with: node)
//            }
        }
    }
    
    func checkJunkCollisions(){
            var hits: [SKSpriteNode] = []
            self.enumerateChildNodes(withName: "junk"){ node, _ in
                let junkNode = node as! SKSpriteNode
                if junkNode.frame.intersects(self.ship.frame){
                    hits.append(junkNode)
                }
                
                for node in hits{
//                    node.removeFromParent()
                    self.collision(with: node)
                }
            }
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
