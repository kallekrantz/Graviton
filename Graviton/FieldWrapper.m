//
//  NSObject+LinearGravity.m
//  GravityDragger
//
//  Created by Karl Johan Krantz on 29/09/14.
//  Copyright (c) 2014 Karl Johan Krantz. All rights reserved.
//

#import "FieldWrapper.h"

@implementation FieldWrapper
+ (SKFieldNode *)linearGravityFieldWithVector:(CGVector)direction{
    vector_float3 vec;
    vec[0] = direction.dx;
    vec[1] = direction.dy;
    
    return [ SKFieldNode linearGravityFieldWithVector:vec ];
}
@end
