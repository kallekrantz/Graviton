//
//  CGPointExtension.swift
//  Trat
//
//  Created by Karl Johan Krantz on 26/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

extension CGPoint{
    init(vector:CGVector){
        self = CGPointMake(vector.dx, vector.dy)
    }
}
