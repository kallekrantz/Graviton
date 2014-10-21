//
//  Level.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 30/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

protocol Level{
    func createObstacles(frame:CGRect) -> [SKNode]
    func createFields(frame:CGRect) -> [FieldNode]
    func createStart(frame:CGRect) -> SKNode
    func createFinish(frame:CGRect) -> SKNode
    func startLevel();
    func isFieldAllowed(type:FieldTypes) -> Bool;
    func showHUD() -> Bool;
}

func createWalls(frame:CGRect) -> [SKNode]{
    let maxY = frame.maxY;
    let maxX = frame.maxX;
    
    let wallSize = CGSizeMake(20, maxY);
    let groundSize = CGSizeMake(maxX, 20)
    
    var leftWall =  createObstacle(CGPointMake(0,0), wallSize)
    var rightWall = createObstacle(CGPointMake(maxX-20,0), wallSize)
    var ground = createObstacle(CGPointMake(0, maxY-20), groundSize)
    var roof = createObstacle(CGPointMake(0,0), groundSize)

    return [leftWall, rightWall, ground, roof];
}

func createObstacle(point:CGPoint, size:CGSize) -> SKShapeNode{
    let obstacle = SKShapeNode.createBox(point, size: size)
    obstacle.fillTexture = SKTexture(imageNamed: "rustTexture")
    obstacle.physicsBody?.dynamic = false;
    return obstacle;
}

func createVictorySquare(size:CGSize) -> SKSpriteNode{
    let victorySquare = SKSpriteNode(imageNamed: "pipe")
    victorySquare.size = size;
    return victorySquare
}

func createPlayerBox(size:CGSize) -> SKSpriteNode{
    let playerBox = SKSpriteNode(imageNamed: "supplybox")
    playerBox.size = size;
    return playerBox;
}