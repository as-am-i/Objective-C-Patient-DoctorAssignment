//
//  main.m
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "HealthRegistory.h"
#import "Doctor.h"
#import "Patient.h"

#import "Symptom.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        // Health Registory
        HealthRegistory *registory = [HealthRegistory new];
        
        // Patient
        NSString *name = [InputCollector inputForPrompt:@"Patient name: "];
        NSString *stringAge = [InputCollector inputForPrompt:@"Patient age: "];
        int age = [stringAge intValue];
        Patient *patient = [[Patient alloc]initWithName:name andAge:age];
        
        // Doctor
        name = [InputCollector inputForPrompt:@"Doctor name: "];
        NSString *specialization = [InputCollector inputForPrompt:@"Doctor specialization: "];
        Doctor *doctor = [[Doctor alloc]initWithName:name andSpecialization:specialization];
        [registory addDoctor:doctor];
        
        // Doctor asks for a card and a symptom
        NSString *question = [NSString stringWithFormat:@"%@: Do you have a valid health card?\n%@: (y/n) ", doctor.name, patient.name];
        NSString *answer = [InputCollector inputForPrompt:question];
        [doctor askPatientsCards:patient andAnswer:answer];
        
        if ([patient hasValidCard]) {
            question = [NSString stringWithFormat:@"%@: How do you feel today?\n%@: (Explain your symptoms) ", doctor.name, patient.name];
            Symptom *symptom = [Symptom new];
            symptom.symptom = [InputCollector inputForPrompt:question];
            
            // Prescription created
            Prescription *prescription = [doctor requestMedication:patient andSymptoms:symptom];
            [registory addPrescription:prescription];
            
            // Multiple symptoms
            while (![answer isEqualToString:@"q"] && ![answer isEqualToString:@"'q'"]) {
                question = [NSString stringWithFormat:@"%@: Anything else?\n%@: (Explain your symptoms or type 'q' to quit) ", doctor.name, patient.name];
                answer = [InputCollector inputForPrompt:question];
            
                if (![answer isEqualToString:@"q"] && ![answer isEqualToString:@"'q'"]) {
                    Symptom *symptom = [Symptom new];
                    symptom.symptom = answer;
                    
                    // Prescription created
                    Prescription *prescription = [doctor requestMedication:patient andSymptoms:symptom];
                    [registory addPrescription:prescription];
                }
            }
            
            // Prescription showed
            [InputCollector printToPrompt:[NSString stringWithFormat:@"Here are ALL %@'s priscriptions.\n", [patient name]]];
            [InputCollector printToPrompt:[registory showAllPrescriptionsFrom:doctor forPatient:patient]];
            
        } else {
            [InputCollector printToPrompt:@"Cannot ask for prescriptions: Invalid card"];
        }
        

        
        
        
        
    }
    return 0;
}
