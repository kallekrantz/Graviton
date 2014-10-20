//
//  MainMenuScene.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

class MainMenuScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        println(self.frame)
        let textLabel = SKLabelNode()
        textLabel.position = CGPointMake(self.frame.maxX/2, self.frame.maxY/2)
        textLabel.text = "Main Menu";
        textLabel.color = NSColor.yellowColor();
        let node = SKShapeNode(circleOfRadius: 0.1);
        node.position = CGPointMake(self.frame.maxX/2, self.frame.maxY/2)
        node.fillColor = NSColor.redColor()
        addChild(node)
        addChild(textLabel)
    }
}