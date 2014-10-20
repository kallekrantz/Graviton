//
//  RadialGravity.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 04/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class RadialGravityNode : FieldNode{
    override init(size: CGSize, allowEditing:Bool) {
        super.init(size: size, allowEditing: allowEditing)
        
        let radius = CGVector(dx: size.width, dy: size.height).length()/2
        self.fieldVisualization = SKShapeNode(circleOfRadius: radius);
        
        self.fieldVisualization!.position.x += size.width/2
        self.fieldVisualization!.position.y += size.height/2
        fieldVisualization!.lineWidth = 8;
        fieldVisualization!.fillShader = SKShader(fileNamed: "repulsorShader")
        fieldVisualization!.strokeColor = NSColor(calibratedRed: 0, green: 1, blue: 0, alpha: 0)
        let fieldNode = SKFieldNode.radialGravityField()
        fieldNode.region = SKRegion(radius: Float(radius))
        fieldNode.strength = -20
        fieldNode.name = "fieldNode"
        
        fieldVisualization!.addChild(fieldNode)
        fieldVisualization!.fillColor = NSColor.yellowColor()
        fieldVisualization!.name = "fieldVisualization"
        addChild(fieldVisualization!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}