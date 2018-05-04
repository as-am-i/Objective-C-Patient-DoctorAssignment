//
//  HealthRegistory.m
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-03.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import "HealthRegistory.h"

@implementation HealthRegistory

- (instancetype)init{
    self = [super init];
    if (self) {
        _allDoctors = [NSMutableArray new];
        _allPrescriptions = [NSMutableDictionary new];
    }
    return self;
}

- (void) addDoctor:(Doctor *)doctor{
    [self.allDoctors addObject:doctor];
}

- (void) addPrescription:(Prescription *)prescription{
    NSString *patientName = prescription.patient.name;
    
    if ([[self allPrescriptions] objectForKey:patientName] == nil) {
        NSMutableArray *presctiptionsForPatient = [NSMutableArray new];
        [self.allPrescriptions setObject:presctiptionsForPatient forKey:patientName];
    }
    
    NSMutableArray *tempPrescriptionArray = [self.allPrescriptions objectForKey:patientName];
    [tempPrescriptionArray addObject:prescription];
    [self.allPrescriptions setObject:tempPrescriptionArray forKey:patientName];
}

- (NSString *) showAllPrescriptionsFrom:(Doctor *)doctor forPatient:(Patient *)patient{
    if ([self.allDoctors containsObject:doctor]) {
        
        NSString *stringPieces = @"";
        NSString *stringToPrint = @"";
        NSMutableArray *prescriptions = [self.allPrescriptions objectForKey:patient.name];
        
        for (Prescription *prescription in prescriptions) {
            if ([prescription isEqualTo:prescriptions.lastObject]) {
                stringPieces = [NSString stringWithFormat:@"%@", [prescription prescription]];
            } else {
                stringPieces = [NSString stringWithFormat:@"%@,\n", [prescription prescription]];
            }
            stringToPrint = [stringToPrint stringByAppendingString:stringPieces];
        }
        return stringToPrint;
        
    } else {
        return nil;
    }
}



@end
