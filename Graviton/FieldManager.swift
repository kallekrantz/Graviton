//
//  FieldManager.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 07/10/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

class FieldManager{
    var fields:[FieldNode] = [];
    func addField(node:FieldNode){
        fields.append(node);
    }
    func clearFields(){
        for field in fields{
            field.removeFromParent()
        }
        fields = [];
    }
}