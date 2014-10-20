//
//  EventExtension.swift
//  Trat
//
//  Created by Karl Johan Krantz on 21/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import AppKit
extension NSEvent {
    
    var character: Int {
        // Note that you could also use Int(keyCode)
        return Int(charactersIgnoringModifiers!.utf16[0])
    }
    
}