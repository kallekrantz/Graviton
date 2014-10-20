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

class SpringNode : FieldNode{
    var fieldNode:SKFieldNode;
    var strength:Float{
        get{
            return fieldNode.strength;
        }
        set(strength){
            fieldNode.strength = strength;
        }
    }
    override init(size: CGSize, allowEditing:Bool) {
        fieldNode = SKFieldNode.springField()
        fieldNode.region = SKRegion(size: size)
        fieldNode.strength = 20
        fieldNode.name = "fieldNode"
        
        super.init(size: size, allowEditing: allowEditing);
        
        fieldVisualization = SKShapeNode(rectOfSize: size);
        fieldVisualization!.position.x += size.width/2
        fieldVisualization!.position.y += size.height/2
        fieldVisualization!.lineWidth = 8;
        fieldVisualization?.strokeColor = NSColor(calibratedRed: 0, green: 1, blue: 0, alpha: 0)
        fieldVisualization!.addChild(fieldNode)
        fieldVisualization!.alpha = 0.2
        fieldVisualization!.name = "fieldVisualization"
        fieldVisualization!.fillShader = SKShader(fileNamed: "springShader.fsh")
        addChild(fieldVisualization!)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}