//
//  Patient.m
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "Patient.h"

@implementation Patient

-(instancetype)initWithName:(NSString *)name andAge:(int)age{
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

@end
