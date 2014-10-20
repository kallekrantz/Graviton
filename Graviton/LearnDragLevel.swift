//
//  ThirdLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

//
//  SecondLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

class LearnDragLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        var obstacles = createWalls(frame);
        
        let label = NORLabelNode(fontNamed: "Helvetica")
        
        let action = AnimatableText.animateText(3, text: "What a DRAG, the spring field isn't affecting us!", label: label);
        label.position = CGPointMake(maxX/2, 4*maxY/5)
        label.runAction(action);
        
        obstacles += [label];
        
        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        let spring = SpringNode(size: CGSizeMake(frame.maxX, frame.maxY/5), allowEditing: true);
        spring.position = CGPointMake(0, frame.maxY/5-50)
        spring.strength = 8;
        return [spring]
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/5, y: frame.maxY/2)
        let node = SKShapeNode(rectOfSize: CGSizeMake(100, 100))
        node.position = startPosition
        node.physicsBody = SKPhysicsBody(rectangleOfSize: CGSizeMake(100, 100));
        node.fillColor = NSColor.greenColor()
        node.physicsBody?.dynamic = false;

        playerBox = node;

        return node;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let victorySquare = SKShapeNode(rectOfSize: CGSizeMake(frame.maxX/5, frame.maxY/5))
        victorySquare.position.x = 4*frame.maxX/5
        victorySquare.position.y = frame.maxY/2
        victorySquare.fillColor = NSColor.blueColor()
        victorySquare.alpha = 0.4
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