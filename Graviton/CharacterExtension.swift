//
//  CharacterExtension.swift
//  Trat
//
//  Created by Karl Johan Krantz on 21/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

extension Character {
    
    var keyCode: Int {
        return Int(String(self).utf16[0])
    }
    
}

extension String {
    
    var keyCode: Int {
        return Int(String(self).utf16[0])
    }
    
}