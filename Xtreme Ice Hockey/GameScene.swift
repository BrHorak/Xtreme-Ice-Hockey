//
//  GameScene.swift
//  Xtreme Ice Hockey
//
//  Created by Bret Horak on 4/4/18.
//  Copyright © 2018 Bret Horak. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var upperPaddle = SKSpriteNode()
    var lowerPaddle = SKSpriteNode()
    var puck = SKShapeNode()
    
    override func didMove(to view: SKView)
    {
        makePuck()
        makeLowerPaddle()
    }
    
    func makePuck()
    {
        puck = SKShapeNode(circleOfRadius: 50)
        puck.position = CGPoint(x: frame.midX, y: frame.midY)
        puck.strokeColor = UIColor.white
        puck.fillColor = UIColor.black
        puck.name = "puck"
        
        // physics shape matches ball image
        puck.physicsBody = SKPhysicsBody(circleOfRadius: 10)
        // ignores all forces and impluses
        puck.physicsBody?.isDynamic = false
        // use precise collision detection
        puck.physicsBody?.usesPreciseCollisionDetection = true
        // no loss os energy from friction
        puck.physicsBody?.friction = 0
        // gravity is not a factor
        puck.physicsBody?.affectedByGravity = false
        // bounces fully off of other objects
        puck.physicsBody?.restitution = 1
        // slows down over time
        puck.physicsBody?.linearDamping = 1
        puck.physicsBody?.contactTestBitMask = (puck.physicsBody?.collisionBitMask)!
        
        addChild(puck) // add ball object to the view
    }
    
    func makeLowerPaddle()
    {
        lowerPaddle = SKSpriteNode(color: UIColor.red, size: CGSize(width: frame.width/4, height: 50))
        lowerPaddle.position = CGPoint(x: frame.midX, y: frame.minY + 125)
        lowerPaddle.name = "lower paddle"
        lowerPaddle.physicsBody = SKPhysicsBody(circleOfRadius: 70)
        lowerPaddle.physicsBody?.isDynamic = false
        addChild(lowerPaddle)
    }
    
    
}
