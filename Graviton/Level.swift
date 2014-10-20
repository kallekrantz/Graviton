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
    
    var leftWall =  SKShapeNode.createBox(CGPointMake(0,0), size: wallSize)
    leftWall.fillTexture = SKTexture(imageNamed: "rustTexture")
    var rightWall = SKShapeNode.createBox(CGPointMake(maxX-20,0), size: wallSize)
    rightWall.fillTexture = SKTexture(imageNamed: "rustTexture")
    var ground = SKShapeNode.createBox(CGPointMake(0, maxY-20), size: groundSize)
    ground.fillTexture = SKTexture(imageNamed: "rustTexture")
    var roof = SKShapeNode.createBox(CGPointMake(0,0), size: groundSize)
    roof.fillTexture = SKTexture(imageNamed: "rustTexture")

    
    leftWall.physicsBody?.dynamic = false;
    rightWall.physicsBody?.dynamic = false;
    ground.physicsBody?.dynamic = false;
    roof.physicsBody?.dynamic = false;
    return [leftWall, rightWall, ground, roof];
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