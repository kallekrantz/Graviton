//
//  FirstLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class IntroLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        

        let MainText = NORLabelNode(fontNamed: "Helvetica");
        MainText.text = "Graviton";
        let scale = CGFloat(3.0);
        MainText.xScale = scale;
        MainText.yScale = scale;
        MainText.position = CGPointMake(frame.maxX/2, 2*frame.maxY/3)
        
        let label = ClickableTextNode(fontNamed: "Helvetica")
        var action = AnimatableText.animateText(0.4, text: "Start Game", label: label)
        label.runAction(action);
        label.mouseListener = { event in
            let startLevelAction = SKAction.runBlock{
                self.startLevel();
            }
            label.runAction(SKAction.sequence( [startLevelAction, SKAction.scaleTo(1.5, duration: 0.08), SKAction.scaleTo(1, duration: 0.08)]))
        }
        label.position = CGPointMake(frame.maxX/2, frame.maxY/2);
        
        let label2 = ClickableTextNode(fontNamed: "Helvetica")
        var action2 = AnimatableText.animateText(0.4, text: "Quit Game", label: label2)
        label2.runAction(action2);
        label2.mouseListener = { event in
            NSApplication.sharedApplication().terminate(self)
        }
        label2.position = CGPointMake(frame.maxX/2, frame.maxY/3);

        var obstacles = createWalls(frame);
        obstacles += [label, label2, MainText]

        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: 4*frame.maxX/5, y: 4*frame.maxY/5)
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
        return false;
    }
    
}