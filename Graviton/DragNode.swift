//
//  DragNode.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation


class DragNode : FieldNode{
    override init(size: CGSize, allowEditing:Bool) {
        super.init(size: size, allowEditing: allowEditing);
        fieldVisualization = SKShapeNode(rectOfSize: size);
        fieldVisualization!.position.x += size.width/2
        fieldVisualization!.position.y += size.height/2
        fieldVisualization?.strokeColor = NSColor(calibratedRed: 0, green: 1, blue: 0, alpha: 0)
        let fieldNode = SKFieldNode.dragField()
        fieldNode.region = SKRegion(size: size)
        fieldNode.strength = 5
        fieldNode.name = "fieldNode"
        
        fieldVisualization!.addChild(fieldNode)
        
        fieldVisualization!.fillColor = NSColor.redColor()
        fieldVisualization!.name = "fieldVisualization"
        fieldVisualization!.fillShader = SKShader(fileNamed: "dragShader.fsh")
        addChild(fieldVisualization!)
    }
    
    required  init!(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}