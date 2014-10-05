//
//  Level.swift
//  Graviton
//
//  Created by Karl Johan Krantz on 30/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

import Foundation

protocol Level{
    func createObstacles(frame:CGRect) -> [SKNode]
    func createFields(frame:CGRect) -> [FieldNode]
    func createStart(frame:CGRect) -> SKNode
    func createFinish(frame:CGRect) -> SKNode
}