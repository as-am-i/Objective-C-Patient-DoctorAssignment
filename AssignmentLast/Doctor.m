//
//  Doctor.m
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "Doctor.h"

@implementation Doctor

-(instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization{
    self = [super init];
    if (self) {
        _name = name;
        _specialization = specialization;
        _acceptedPatients = [NSMutableArray new];
    }
    return self;
}

-(void)askPatientsCards:(Patient *)patient andAnswer:(BOOL)answer{
    if (answer == YES) {
        [self.acceptedPatients addObject:patient];
    }
}

@end
