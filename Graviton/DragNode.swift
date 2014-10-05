//
//  DragNode.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation


//
//  SpringGravityNode.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

//
//  RadialGravity.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class DragNode : FieldNode{
    var fieldVisualization:SKShapeNode;
    private var allowEditing:Bool;
    
    init(size: CGSize, allowEditing:Bool) {
        
        self.fieldVisualization = SKShapeNode(rectOfSize: size);
        self.fieldVisualization.position.x += size.width/2
        self.fieldVisualization.position.y += size.height/2
        self.allowEditing = allowEditing
        super.init();
        fieldVisualization.strokeColor = NSColor.clearColor()
        let fieldNode = SKFieldNode.dragField()
        fieldNode.region = SKRegion(size: size)
        fieldNode.strength = 5
        fieldNode.name = "fieldNode"
        
        fieldVisualization.addChild(fieldNode)
        
        fieldVisualization.fillColor = NSColor.redColor()
        fieldVisualization.name = "fieldVisualization"
        fieldVisualization.fillShader = SKShader(fileNamed: "dragShader.fsh")
        addChild(fieldVisualization)
    }
    
    required override init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func makeEditable() {
        if(allowEditing){
            fieldVisualization.strokeColor = NSColor.greenColor()
            self.userInteractionEnabled = true
        }
    }
    
    override func removeEditable() {
        self.userInteractionEnabled = false
        fieldVisualization.strokeColor = NSColor.clearColor()

    }
}