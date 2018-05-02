//
//  Patient.h
//  AssignmentLast
//
//  Created by 谷井朝美 on 2018-05-02.
//  Copyright © 2018 Asami Tanii. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property NSString *name;
@property int age;
@property BOOL hasValidCard;


-(instancetype)initWithName:(NSString *)name andAge:(int)age;

@end
