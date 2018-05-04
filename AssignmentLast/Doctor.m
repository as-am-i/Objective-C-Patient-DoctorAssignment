//
//  Doctor.m
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "Doctor.h"
#import "Prescription.h"

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

-(void)askPatientsCards:(Patient *)patient andAnswer:(NSString *)answer{
    if ([answer isEqualToString:@"y"] ||[answer isEqualToString:@"yes"] || [answer isEqualToString:@"YES"]) {
        patient.hasValidCard = YES;
        [self.acceptedPatients addObject:patient];
    }
}

-(Prescription *)requestMedication:(Patient *)patient andSymptoms:(Symptom *)symptoms{
    Prescription *prescription = [Prescription new];
    
    for (Patient *temp in _acceptedPatients) {
        if ([temp isEqualTo:patient]) {
            prescription.doctor = self;
            prescription.patient = temp;
            
            if ([[symptoms symptom] containsString:@"cold"]) {
                prescription.prescription = @"vitamin C";
            } else if ([[symptoms symptom] containsString:@"tired"]) {
                prescription.prescription = @"Sleep well";
            } else if ([[symptoms symptom] containsString:@"fever"]) {
                prescription.prescription = @"Your body is fighting some kind of underlying illness!";
            } else if ([[symptoms symptom] containsString:@"good"]) {
                prescription.prescription = @"So you don't need to be here anymore";
            } else {
                prescription.prescription = @"See another doctor";
            }
        }
    }
    return prescription;
}

@end
