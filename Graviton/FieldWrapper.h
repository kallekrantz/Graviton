//
//  NSObject+LinearGravity.h
//  GravityDragger
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface FieldWrapper : NSObject
+ (SKFieldNode *)linearGravityFieldWithVector:(CGVector)direction;
@end
