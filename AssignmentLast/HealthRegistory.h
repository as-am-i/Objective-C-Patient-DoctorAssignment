//
//  HealthRegistory.h
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-03.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Prescription.h"
#import "Patient.h"
#import "Doctor.h"

@interface HealthRegistory : NSObject

@property NSMutableArray *allDoctors;
@property NSMutableDictionary *allPrescriptions;

- (instancetype)init;
- (void) addDoctor:(Doctor *)doctor;
- (void) addPrescription:(Prescription *)prescription;
- (NSString *) showAllPrescriptionsFrom:(Doctor *)doctor forPatient:(Patient *)patient;

@end
