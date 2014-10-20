//
//  fieldNode.swift
//  GravityDragger
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

class FieldNode : SKNode{
    
    var allowEditing:Bool;
    var allowMoving:Bool;
    var fieldVisualization:SKShapeNode?;
    
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
    init(size: CGSize, allowEditing:Bool){
        self.allowEditing = allowEditing
        self.allowMoving = allowEditing;
        super.init();
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeEditable(){
        if(allowEditing){
            fieldVisualization?.strokeColor = NSColor.greenColor()
            if(allowMoving){
                self.userInteractionEnabled = true
            }
        }
    }
    
    func removeEditable(){
        self.userInteractionEnabled = false
        fieldVisualization?.strokeColor = NSColor.clearColor()
    }
    
    override func mouseDragged(theEvent: NSEvent) {
        position.x += theEvent.deltaX;
        position.y -= theEvent.deltaY;
    }
}