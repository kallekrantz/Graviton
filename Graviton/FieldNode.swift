//
//  fieldNode.swift
//  GravityDragger
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

class FieldNode : SKNode{
    
    class func createNode(size:CGSize, fieldType:FieldTypes) -> FieldNode{
        
        switch(fieldType){
        case .gravityField:
            return RadialGravityNode(size: size, allowEditing: true)
        case .springField:
            return SpringNode(size: size, allowEditing: true)
        case .dragField:
            return DragNode(size:size, allowEditing: true)
        default:
            fatalError("Unrecognized fieldType")
        }
    }
    
    func makeEditable(){
        fatalError("Needs to be implemented in subclass")
    }
    
    func removeEditable(){
        fatalError("Needs to be implemented in subclass")
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        position.x += theEvent.deltaX;
        position.y -= theEvent.deltaY;
    }
}