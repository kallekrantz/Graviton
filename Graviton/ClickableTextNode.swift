//
//  ClickableTextNode.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 13/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class ClickableTextNode : NORLabelNode{
    
    override init() {
        super.init();
        self.userInteractionEnabled = true;
    }
    
    override init(fontNamed fontName: String!) {
        super.init(fontNamed:fontName);
        self.userInteractionEnabled = true;
    }
 
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    var mouseListener:((event:NSEvent!)->Void)?;

    override func mouseDown(theEvent: NSEvent) {
        mouseListener?(event:theEvent);
    }
}