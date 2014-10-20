//
//  File.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import SpriteKit

class AnimatableText{
    class func animateText(duration:Float, text:String, label:NORLabelNode) -> SKAction{
        var steps = countElements(text)
        var count = 0;
        let wait = duration/Float(steps);
        let actions = SKAction.sequence([SKAction.runBlock{
            var char:String = text[count++];
            label.text.append(Character(char));
            },
            SKAction.waitForDuration(NSTimeInterval(wait))])
        var action = SKAction.repeatAction(actions, count: steps)
        return action;
    }
}