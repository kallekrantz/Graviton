//
//  RadialGravity.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class RadialGravityNode : FieldNode{
    var fieldVisualization:SKShapeNode;
    private var allowEditing:Bool;

    init(size: CGSize, allowEditing:Bool) {
        let length = CGVector(dx: size.width, dy: size.height).length()/2
        self.allowEditing = allowEditing
        self.fieldVisualization = SKShapeNode(circleOfRadius: length);
        self.fieldVisualization.position.x += size.width/2
        self.fieldVisualization.position.y += size.height/2
        fieldVisualization.strokeColor = NSColor.clearColor()
        super.init();
        
        fieldVisualization.lineWidth = 8;
        fieldVisualization.fillShader = SKShader(fileNamed: "repulsorShader")
        let fieldNode = SKFieldNode.radialGravityField()
        fieldNode.region = SKRegion(radius: Float(length))
        fieldNode.strength = -20
        fieldNode.name = "fieldNode"
        
        fieldVisualization.addChild(fieldNode)
        
        fieldVisualization.fillColor = NSColor.redColor()
        fieldVisualization.fillColor = NSColor.yellowColor()
        fieldVisualization.name = "fieldVisualization"
        addChild(fieldVisualization)
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