//
//  UserProfile.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfile : NSCoder

@property (strong, nonatomic) NSString              *loginName;
@property (strong, nonatomic) NSMutableDictionary   *statistics;

@end
