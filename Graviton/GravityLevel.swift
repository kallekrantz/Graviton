//
//  FirstLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class GravityLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        var label = NORLabelNode(fontNamed: "Helvetica")
        var action = AnimatableText.animateText(3, text: "Help! This box with supplies need to \n reach the other side of these pipes. \n\n This SPACE looks interesting...", label: label)
        label.runAction(action);
        label.position = CGPointMake(maxX/3, 4*maxY/5)
        
        var obstacles = createWalls(frame);
        obstacles.append(label);
        
        return obstacles
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: 2*frame.maxX/3, y: 4*frame.maxY/5)
        let size = CGSizeMake(100, 100);
        let playerBox = createPlayerBox(size)
        playerBox.position = startPosition
        playerBox.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        playerBox.physicsBody?.dynamic = false;
        self.playerBox = playerBox;
        return playerBox;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let size = CGSizeMake(frame.maxX/5, frame.maxY/5);
        let victorySquare = createVictorySquare(size);
        victorySquare.position.x = 2*frame.maxX/3
        victorySquare.position.y = frame.maxY/5
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type: FieldTypes) -> Bool {
        return false;
    }
    
    func showHUD() -> Bool {
        return true;
    }
}