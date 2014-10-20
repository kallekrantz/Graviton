//
//  RemoveFieldLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class RemoveFieldLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let label = NORLabelNode(fontNamed: "Helvetica")
        let action = AnimatableText.animateText(4, text: "The springnode is keeping us from reaching the end. \n Remove nodes by clicking them and pressing backspace.", label: label);
        label.position = CGPointMake(maxX/2, 4*maxY/5)
        label.runAction(action);
        
        let helpfulLabel = NORLabelNode(fontNamed: "Helvetica")
        let helpfulTimedAction = SKAction.sequence([SKAction.waitForDuration(12), AnimatableText.animateText(1, text: "If you want to reset your scene, \n a r-r-r-replay might help.", label: helpfulLabel) ])
        helpfulLabel.position = CGPointMake(maxX/4, maxY/4)
        helpfulLabel.runAction(helpfulTimedAction)
        
        var obstacles = createWalls(frame);
        obstacles += [label, helpfulLabel]
        
        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        let spring = SpringNode(size: CGSizeMake(frame.maxX/2, frame.maxY/5), allowEditing: true);
        spring.position = CGPointMake(frame.maxX/2, frame.maxY/2)
        spring.strength = 8;
        spring.allowMoving = false;
        return [spring]
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: frame.maxX/2, y: 3*frame.maxY/5)
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
        victorySquare.position.x = frame.maxX/2
        victorySquare.position.y = frame.maxY/5
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