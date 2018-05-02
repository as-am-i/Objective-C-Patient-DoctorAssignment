//
//  Doctor.h
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Doctor : NSObject

@property NSString *name;
@property NSString *specialization;

-(instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization;

@end
