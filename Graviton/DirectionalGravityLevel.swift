//
//  DirectionalGravityLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 21/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class DirectionalGravityLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let label = NORLabelNode(fontNamed: "Helvetica")
        let action = AnimatableText.animateText(3, text: "There's another field now, the drag field. \n Press 3 to use it.", label: label)
        label.runAction(action);
        label.position = CGPoint(x: frame.maxX/2, y: 3*frame.maxY/4)
        var obstacles = createWalls(frame);
        obstacles.append(label)
        
        let obstacleSize = CGSizeMake(100, frame.maxY/3)
        
        let walls = [createObstacle(CGPoint(x: 2*maxX/6,y: 0), obstacleSize), createObstacle(CGPoint(x: 4*maxX/6,y: 0), obstacleSize)]
        return obstacles + walls;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        let vec = CGVector(dx: 1.5, dy: 3).multiply(2.0)
        let directionalGravityField = DirectionalGravityNode(size: CGSizeMake(frame.maxX/4, frame.maxY/4), allowEditing: false, dir: vec)
        directionalGravityField.position = CGPoint(x: 0, y: 0)
        return [directionalGravityField];
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
        let size = CGSizeMake(frame.maxX/5, frame.maxY/5)
        let victorySquare = createVictorySquare(size)
        victorySquare.position.x = 4*frame.maxX/7
        victorySquare.position.y = frame.maxY/8
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type: FieldTypes) -> Bool {
        return .gravityField == type || .springField == type || .dragField == type;
    }
    
    func showHUD() -> Bool {
        return true;
    }
}