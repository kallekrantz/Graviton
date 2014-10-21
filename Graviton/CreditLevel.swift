//
//  CreditLevel.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class CreditLevel : Level{
    var playerBox:SKNode?;
    init(){}
    func createObstacles(frame:CGRect) -> [SKNode]{
        let maxY = frame.maxY;
        let maxX = frame.maxX;
        
        let creditLabel = NORLabelNode(fontNamed: "Helvetica")
        creditLabel.text = "Thanks for helping us, you're free to \n do what you want in this store room now!"
        let firstCredit = AnimatableText.animateText(0.4, text: "Concept: Karl Johan Krantz", label: creditLabel)
        let secondCredit = AnimatableText.animateText(0.4, text: "Programming: Karl Johan Krantz", label: creditLabel)
        let thirdCredit = AnimatableText.animateText(0.4, text: "Technology: SpriteKit", label: creditLabel)
        let fourthCredit = AnimatableText.animateText(0.4, text: "Thanks for playing!", label: creditLabel)

        
        let clearAction = SKAction.runBlock{
            creditLabel.text = "";
        }
        let waitAction = SKAction.waitForDuration(5)
        
        let seperatorAction = SKAction.sequence([waitAction, clearAction])
        
        let actionSequence = SKAction.sequence(
                [waitAction,
                 seperatorAction, firstCredit,
                 seperatorAction, secondCredit,
                 seperatorAction, thirdCredit,
                 seperatorAction, fourthCredit]
        )
        
        creditLabel.position = CGPointMake(frame.maxX/2, frame.maxY/3)
        creditLabel.runAction(actionSequence)
        
        let exitLabel = ClickableTextNode(fontNamed: "Helvetica")
        var exitAction = AnimatableText.animateText(0.4, text: "Exit Game", label: exitLabel)
        exitLabel.runAction(exitAction);
        exitLabel.mouseListener = { event in
            NSApplication.sharedApplication().terminate(self)
        }
        exitLabel.position = CGPointMake(6*frame.maxX/7, 6*frame.maxY/7);
        
        var obstacles = createWalls(frame);
        obstacles += [exitLabel, creditLabel]
        
        return obstacles;
    }
    func createFields(frame:CGRect) -> [FieldNode]{
        return []
    }
    func createStart(frame:CGRect) -> SKNode{
        let startPosition = CGPoint(x: 3*frame.maxX/5-100, y: 72)
        let size = CGSizeMake(100, 100)
        let node = createPlayerBox(size)
        node.position = startPosition
        node.physicsBody = SKPhysicsBody(rectangleOfSize: size);
        node.physicsBody?.dynamic = false;
        
        playerBox = node;
        return node;
    }
    func createFinish(frame:CGRect) -> SKNode{
        let size = CGSizeMake(0,0);
        let victorySquare = createVictorySquare(size)
        //You can't win this level!
        victorySquare.position.x = 2*frame.maxX
        
        return victorySquare
    }
    
    func startLevel() {
        playerBox?.physicsBody?.dynamic = true;
    }
    
    func isFieldAllowed(type: FieldTypes) -> Bool {
        return true;
    }
    
    func showHUD() -> Bool {
        return false;
    }
    
}