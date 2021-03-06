//
//  UserProfile.m
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "UserProfile.h"

@implementation UserProfile

-(id) init
{
    if (self = [super init])
    {
        self.loginName  = @"An undefined login name";
        self.statistics = [NSMutableDictionary new];
    }
    
    return self;
}

+(UserProfile*) deserialiseFileAsUserProfile:(NSString *)path
{
    UserProfile *user = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    
    NSLog((user ? @"Success derialisation:%@" : @"Deserialisation have failed:%@"), path);
    
    return user;
}

-(void) addAnswer:(NSMutableArray*)array withIndex:(size_t)answerIndex;
{
    if (!self.statistics)
    {
        NSLog(@"==>Stat == NULL!!");
        self.statistics = [NSMutableDictionary new];
    }
 
    NSLog(@"==>Adding for index %lu array = %@", answerIndex, array);
    
    if (self.statistics == NULL)
        NSLog(@"STAT ANYWAY == NULL");
    
    [self.statistics setObject:array forKey:[NSNumber numberWithUnsignedInteger:answerIndex]];
}

-(void) encodeWithCoder:(NSCoder*)coder
{
    [coder encodeObject:self.loginName  forKey:@"loginName"];
    [coder encodeObject:self.statistics forKey:@"statistics"];
}

-(void) serialiseUserProfileToFile:(NSString *)path
{
    NSError *error = NULL;
    NSData  *plist = [NSKeyedArchiver archivedDataWithRootObject:self];
    
    if (!error)
    {
        bool ok = [plist writeToFile:path atomically:true];
        
        NSLog(ok ? @"Success userprofile serialisation!" : @"Error writing to the file: %@", path);
    }
    else
        NSLog(@"Error: %@", error);
}

-(bool) isAnswerExists:(size_t)index
{
    return [self.statistics objectForKey:[NSNumber numberWithUnsignedInteger:index]] != NULL;
}

-(bool) isAnswerCorrect:(size_t)index withQuestion:(Question*)question;
{
    const NSMutableArray *arr = [self.statistics objectForKey:[NSNumber numberWithUnsignedInteger:index]];
    
    if (arr == NULL)
        return false;
    
    return [arr isEqualToArray:question.answers];
}

-(bool) isStatisticsForQuestionAtIndexExists:(size_t)questionIndex;
{
    NSNumber *index = [NSNumber numberWithUnsignedInteger:questionIndex];
    
    return [self.statistics objectForKey:index] != NULL;
}

-(id) initWithCoder:(NSCoder*)coder
{
    if (self = [super init])
    {
        self.loginName  = [coder decodeObjectForKey:@"loginName"];
        self.statistics = [coder decodeObjectForKey:@"statistics"];
    }
    else
        NSLog(@"The userprofile inited with NULL!");
    
    return self;
}

+(NSString*) getUserProfilePath:(NSString*)userName
{
    NSString* const fileName = [NSString stringWithFormat:@"User_%@.plist", userName];
    
    return [root stringByAppendingString:fileName];
}

-(NSMutableArray<NSNumber*>*) getStatisticsForQuestionAtIndex:(size_t)index
{
    return [self isStatisticsForQuestionAtIndexExists:index] ? [self.statistics objectForKey:[NSNumber numberWithUnsignedInteger:index]] : NULL;
}

@end
