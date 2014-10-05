//
//  GameScene.swift
//  GravityDragger
//
//  Created by Karl Johan Krantz on 28/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var worldNode:SKNode;
    var dragInProgress:Bool
    var dragStartLocation:CGPoint
    var label:SKLabelNode;
    var selectedField:FieldTypes;
    var victorySquare:SKNode
    var playerBox:SKNode
    var nodeBeingEdited:FieldNode?;
    
    required init!(coder aDecoder: NSCoder!) {
        worldNode = SKNode();
        dragInProgress = false;
        dragStartLocation = CGPoint();
        label = SKLabelNode();
        selectedField = FieldTypes.gravityField
        victorySquare = SKShapeNode()
        playerBox = SKNode()
        super.init(coder:aDecoder)
        super.addChild(worldNode)
        self.backgroundColor = SKColor.blackColor()
    }
    
    func createLevel(level:Level){
        victorySquare = level.createFinish(self.frame)
        playerBox = level.createStart(self.frame)
        
        let obstacles = level.createObstacles(self.frame)
        let fields = level.createFields(self.frame)
        
        playerBox.physicsBody?.dynamic = false;
        
        addChild(victorySquare)
        addChild(playerBox)
        addChilds(obstacles)
        addChilds(fields)
    }
    
    func resetLevel(level:Level){
        playerBox.removeFromParent()
        playerBox = level.createStart(self.frame)
        playerBox.physicsBody?.dynamic = false;
        addChild(playerBox)
    }
    
    override func didMoveToView(view: SKView) {
        let middleOfScreen = CGPointMake(self.frame.maxX/2, self.frame.maxX/2);
        label = SKLabelNode(fontNamed: "Helvetica")
        label.text = "Gravity Field"
        label.position = middleOfScreen
        addChild(label)
        createLevel(BasicTest())
    }
    
    func startLevel(){
        playerBox.physicsBody?.dynamic = true;
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if(playerBox.frame.intersects(victorySquare.frame)){
            label.text = "Winning!!!";
        }
        
    }
    
    override func addChild(node: SKNode) {
        worldNode.addChild(node)
    }
    
}
