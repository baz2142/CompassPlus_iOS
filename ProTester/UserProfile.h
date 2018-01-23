//
//  UserProfile.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"
#import "Question.h"

@interface UserProfile: NSCoder

@property (strong, nonatomic) NSString *loginName;
@property (strong, nonatomic) NSMutableDictionary<NSNumber*, NSMutableArray<NSNumber*>*> *statistics;

+(UserProfile*) deserialiseFileAsUserProfile:(NSString *)path;
+(NSString*)    getUserProfilePath:(NSString*)userName;

-(id) initWithCoder:(NSCoder*)coder;

-(void) addAnswer:(NSMutableArray*)array withIndex:(size_t)answerIndex;
-(void) encodeWithCoder:(NSCoder*)coder;
-(void) serialiseUserProfileToFile:(NSString *)path;

-(bool) isAnswerExists:(size_t)index;
-(bool) isAnswerCorrect:(size_t)index withQuestion:(Question*)question;
-(bool) isStatisticsForQuestionAtIndexExists:(size_t)questionIndex;

-(NSMutableArray<NSNumber*>*) getStatisticsForQuestionAtIndex:(size_t)index;


@end
