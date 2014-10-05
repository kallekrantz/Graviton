//
//  SKNodeExtension.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 30/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

extension SKNode{
    func addChilds(nodes:[SKNode]){
        for node in nodes{
            addChild(node);
        }
    }
}
