//
//  CGVectorExtensions.swift
//  Trat
//
//  Created by Karl Johan Krantz on 22/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

extension CGVector{
    func multiply(vecB:CGVector) -> CGVector{
        return CGVectorMake(self.dx*vecB.dx, self.dy*vecB.dy)
    }
    func multiply(float:CGFloat) -> CGVector{
        return CGVectorMake(self.dx*float, self.dy*float)
    }
    
    func add(vecB:CGVector) -> CGVector{
        return CGVectorMake(self.dx+vecB.dx, self.dy+vecB.dy)
    }
    func add(float:CGFloat) -> CGVector{
        return CGVectorMake(self.dx+float, self.dy+float)
    }
    
    func subtract(vec:CGVector) -> CGVector{
        return CGVectorMake(self.dx-vec.dx, self.dy-vec.dy)
    }
    func subtract(float:CGFloat) -> CGVector{
        return CGVectorMake(self.dx-float, self.dy-float)
    }
    
    func divide(vec:CGVector) -> CGVector{
        return CGVectorMake(self.dx/vec.dx, self.dy/vec.dy)
    }
    
    func divide(float:CGFloat) -> CGVector{
        return CGVectorMake(self.dx/float, self.dy/float)
    }
    
    func normalize() -> CGVector{
        return CGVector(vector: self).divide(self.length());
    }
    
    func length() -> CGFloat{
        return sqrt(self.dx*self.dx + self.dy*self.dy)
    }
    
    init(vector:CGVector){
        self.dx = vector.dx;
        self.dy = vector.dy;
    }
    
    init(point:CGPoint){
        self.dx = point.x
        self.dy = point.y
    }
}