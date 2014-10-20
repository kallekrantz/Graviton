//
//  BasicTest.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 30/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class BasicTest : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let wallSize = CGSizeMake(20, maxY);
        let groundSize = CGSizeMake(maxX, 20)
        
        var leftWall =  SKShapeNode.createBox(CGPointMake(0,0), size: wallSize)
        var rightWall = SKShapeNode.createBox(CGPointMake(maxX-20,0), size: wallSize)
        var ground = SKShapeNode.createBox(CGPointMake(0, maxY-20), size: groundSize)
        var roof = SKShapeNode.createBox(CGPointMake(0,0), size: groundSize)
        
        leftWall.physicsBody?.dynamic = false;
        rightWall.physicsBody?.dynamic = false;
        ground.physicsBody?.dynamic = false;
        roof.physicsBody?.dynamic = false;
        
        let obstacleSize = CGSizeMake(100, 3*maxY/5)
        
        let obstacle1 = SKShapeNode.createBox(CGPoint(x: maxX/3, y: 0), size: obstacleSize)
        obstacle1.physicsBody?.dynamic = false
        
        let obstacle2 = SKShapeNode.createBox(CGPoint(x: 2*maxX/3, y: 2*maxY/5), size: obstacleSize)
        obstacle2.physicsBody?.dynamic = false
        
        return [leftWall, rightWall, ground, roof, obstacle1, obstacle2];
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/5, y: frame.maxY/5)
        let node = SKShapeNode(rectOfSize: CGSizeMake(100, 100))
        node.position = startPosition
        node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(100, 100));
        node.fillColor = NSColor.greenColor()
        return node;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let victorySquare = SKShapeNode(rectOfSize: CGSizeMake(frame.maxX/5, frame.maxY/5))
        victorySquare.position.x = 4*frame.maxX/5
        victorySquare.position.y = 4*frame.maxY/5
        victorySquare.fillColor = NSColor.blueColor()
        victorySquare.alpha = 0.4
        return victorySquare
    }

    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }

    func isFieldAllowed(type:FieldTypes) -> Bool{
        return false;
    }
    
}