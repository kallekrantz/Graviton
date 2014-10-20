//
//  SKShapeNodeExtension.swift
//  Trat
//
//  Created by Karl Johan Krantz on 26/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

extension SKShapeNode{
    class func createBox(location: CGPoint, size: CGSize) -> SKShapeNode{
        var rect = CGRectMake(0, 0, size.width, size.height)
        var box = SKShapeNode(rect: rect);
        box.position = location
        box.physicsBody = SKPhysicsBody(polygonFromPath: CGPathCreateWithRect(rect, nil))
        box.name = "box"
        
        box.strokeColor = NSColor(calibratedRed: 0, green: 0, blue: 0, alpha: 0);
        //box.position = location;
        box.fillColor = NSColor(calibratedRed: 1, green: 1, blue: 0, alpha: 1)
        box.physicsBody!.dynamic = true
        box.physicsBody!.contactTestBitMask = 0x1 << 8
        box.physicsBody!.fieldBitMask = 0xFFFFFFFF
        
        return box;
    }
}
