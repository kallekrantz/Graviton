//
//  Labyrinth.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 30/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class LabyrinthLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let obstacles = createWalls(frame);
        
        let obstacleSize = CGSizeMake(100, 3*maxY/5)
        
        let obstacle1 = createObstacle(CGPoint(x: maxX/3, y: 0), obstacleSize)
        let obstacle2 = createObstacle(CGPoint(x: 2*maxX/3, y: 2*maxY/5), obstacleSize)
        
        return obstacles + [obstacle1, obstacle2];
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/8, y: frame.maxY/9)
        let size = CGSizeMake(100, 100)
        let node = createPlayerBox(size)
        node.position = startPosition
        node.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        playerBox = node;
        node.physicsBody?.dynamic = false;
        return node;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let size = CGSizeMake(frame.maxX/5, frame.maxY/5);
        let victorySquare = createVictorySquare(size)
        victorySquare.position.x = 7*frame.maxX/8
        victorySquare.position.y = 7*frame.maxY/8
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type:FieldTypes) -> Bool{
        return true;
    }
    
    func showHUD() -> Bool {
        return true;
    }
}