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
    var dragInProgress:Bool;
    var dragStartLocation:CGPoint
    var selectedField:FieldTypes;
    var nodeBeingEdited:FieldNode?;
    var levelManager:LevelManager;
    var gameManager:GameManager;
    var fieldManager:FieldManager;
    
    required init!(coder aDecoder: NSCoder) {
        worldNode = SKNode();
        selectedField = FieldTypes.springField
        levelManager = LevelManager()
        gameManager = GameManager(frame: CGRect())
        dragInProgress = false;
        dragStartLocation = CGPoint();
        fieldManager = FieldManager();
        super.init(coder:aDecoder)
        super.addChild(worldNode)
        self.backgroundColor = SKColor.blackColor()
    }
    

    

    
    override func didMoveToView(view: SKView) {
        let middleOfScreen = CGPointMake(self.frame.maxX/2, self.frame.maxY/2);
        //label.text = "Gravity Field"
        gameManager.frame = self.frame;
        

        let levelNode = gameManager.createLevel()
        addChild(levelNode);
        
    }
    
    func startLevel(){
        nodeBeingEdited?.removeEditable()
        gameManager.startLevel()
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        if(gameManager.completedLevel()){
            fieldManager.clearFields();
            gameManager.victoryAchieved();
        }
        
    }
    
    override func addChild(node: SKNode) {
        worldNode.addChild(node)
    }
    
}
