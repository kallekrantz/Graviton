//
//  StringExtensions.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 05/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation
extension String{
    subscript (i: Int) -> String {
        return String(Array(self)[i])
    }
}
