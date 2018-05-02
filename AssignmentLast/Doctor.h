//
//  Doctor.h
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Patient.h"

@interface Doctor : NSObject

@property NSString *name;
@property NSString *specialization;
@property NSMutableArray *acceptedPatients;

-(instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization;
-(void)askPatientsCards:(Patient *)patient andAnswer:(BOOL)answer;

@end
