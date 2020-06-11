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
    
    //MARK: Conditions
    var score = 0
    var combo = 0
    
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
        ship = Ship()
        ship.position = CGPoint(x: frame.size.width/2, y: frame.size.height/8)
        self.addChild(ship)
    }
    
    //MARK: Create Meteor
    func createMeteor(){
        //Meteor
        let meteor = Meteor()
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
    
    //MARK: Create Junk
    func createJunk(){
        let junk1 = Junk()
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
    
    //MARK: Collisions
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
                self.gameOver()
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
    
    //MARK: Touches Moved
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let position = touch.location(in: self)
        let shipPoistion = CGPoint(x: position.x, y: frame.size.height/8)
        let movement = SKAction.move(to: shipPoistion, duration: 0.4)
        ship.run(movement)
    }
    
    //MARK: Touches Began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //MARK: Transistions
    func gameOver(){
        let gameOverScene = GameOverScene(size: (self.view?.bounds.size)!)
        gameOverScene.scaleMode = .aspectFill
        let crossFade = SKTransition.crossFade(withDuration: 0.75)
        view?.presentScene(gameOverScene, transition: crossFade)
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
//
    
//
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
//
//    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//    }
}
