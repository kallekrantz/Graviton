//
//  FourthLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 07/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

class CreateFieldLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;

        let label = NORLabelNode(fontNamed: "Helvetica")
        let action = AnimatableText.animateText(3, text: "We don't seem to have any fields.. Maybe you can fix that! \n Just click and drag the area! ", label: label)
        label.position = CGPointMake(maxX/2, maxY/2)
        label.runAction(action);
        

        var obstacles = createWalls(frame);
        obstacles += [label];
        
        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return [];
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/2, y: frame.maxY/5)
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
        return .springField == type;
    }
    
    func showHUD() -> Bool {
        return true;
    }
}