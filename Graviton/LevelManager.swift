//
//  GameManager.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation


class LevelManager{
    var levels:[Level];
    
    init(){
        levels = [IntroLevel(), GravityLevel(), SpringLevel(), RemoveFieldLevel(), LearnDragLevel(), CreateFieldLevel(), RadialGravityLevel(), DirectionalGravityLevel()]
    }
    
    func getNextLevel() -> Level{
        return levels.removeAtIndex(0);
    }
    
    func hasMoreLevels() -> Bool{
        return countElements(levels) > 0;
    }
}