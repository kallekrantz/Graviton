//
//  GameManager.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class GameManager{
    var victorySquare:SKNode;
    var playerBox:SKNode;
    private var gameInProgress:Bool;
    var currentLevel:Level;
    
    var levelManager:LevelManager;
    
    
    var frame:CGRect
    
    var levelNode:SKNode?;
    
    init(frame:CGRect){
        victorySquare = SKNode();
        playerBox = SKNode();
        levelManager = LevelManager();
        currentLevel = levelManager.getNextLevel();
        self.frame = frame;
        gameInProgress = false;
    }
    
    func createLevel() -> SKNode{
        if(levelNode == nil){
            levelNode = SKNode();
        }
        victorySquare = currentLevel.createFinish(self.frame)
        playerBox = currentLevel.createStart(self.frame)
        
        let obstacles = currentLevel.createObstacles(self.frame)
        let fields = currentLevel.createFields(self.frame)
        
        playerBox.physicsBody?.dynamic = false;
        
        levelNode?.addChild(victorySquare)
        levelNode?.addChild(playerBox)
        levelNode?.addChilds(obstacles)
        levelNode?.addChilds(fields)
        
        return levelNode!;
    }
    
    func resetLevel(){
        playerBox.removeFromParent()
        playerBox = currentLevel.createStart(self.frame)
        gameInProgress = false;
        levelNode?.addChild(playerBox)
    }
    func startLevel(){
        currentLevel.startLevel()
        gameInProgress = true;
    }
    
    func victoryAchieved(){
        if(levelManager.hasMoreLevels()){
            currentLevel = levelManager.getNextLevel()
            levelNode?.removeAllChildren()
            createLevel();
        }
        gameInProgress = false;
    }
    
    func completedLevel() -> Bool{
        return victorySquare.frame.intersects(playerBox.frame)
    }
    
    func levelInProgress() -> Bool{
        return gameInProgress;
    }
}