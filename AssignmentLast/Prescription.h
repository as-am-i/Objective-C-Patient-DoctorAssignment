//
//  Prescription.h
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-03.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

@interface Prescription : NSObject

@property Doctor *doctor;
@property Patient *patient;
@property NSMutableArray *symptoms;

@property NSString *prescription;


@end
