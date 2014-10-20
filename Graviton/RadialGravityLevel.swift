//
//  FourthLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 07/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

class RadialGravityLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let label = NORLabelNode(fontNamed: "Helvetica")
        let action = AnimatableText.animateText(3, text: "I just gave you a new field to use. \n Press 2 to use the radial repulsor field.", label: label)
        label.runAction(action);
        label.position = CGPoint(x: frame.maxX/2, y: 3*frame.maxY/4)
        var obstacles = createWalls(frame);
        obstacles.append(label)
        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        let strongSpring = SpringNode(size: CGSizeMake(frame.maxX, frame.maxY/4), allowEditing: false)
        strongSpring.position = CGPoint(x: 0, y: 0)
        strongSpring.strength = 80
        return [strongSpring];
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/6, y: frame.maxY/5)
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
        victorySquare.position.x = frame.maxX/2
        victorySquare.position.y = 4*frame.maxY/5
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type: FieldTypes) -> Bool {
        return .gravityField == type || .springField == type;
    }
    
    func showHUD() -> Bool {
        return true;
    }
}