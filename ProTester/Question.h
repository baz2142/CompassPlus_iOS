//
//  Question.h
//  ProTester
//
//  Created by Nickita on 1/2/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Common.h"

@interface Question: NSCoder

@property (strong, nonatomic) NSString         *pictPath;
@property (strong, nonatomic) NSString         *questionText;
@property (strong, nonatomic) NSMutableArray   *answers;
@property (nonatomic)         size_t           correctAnswerIndex;

-(void) addAnswer: (NSString *)answer;
-(void) encodeWithCoder: (NSCoder*) coder;

-(void) setPictPath:(NSString *)pictPath;
-(void) setQuestionText:(NSString *)questionText;
-(void) setCorrectAnswerIndex:(size_t)correctAnswerIndex;

-(id) initWithCoder: (NSCoder*) coder;

-(NSString*)    getPictPath;
-(NSString*)    getQuestionText;
-(NSString*)    getAnswerAtIndex: (size_t)index;
-(size_t)       getCorrectAnswerIndex;

+(void) serialiseArrayToFile:(NSMutableArray<Question*>*)array listFilePath:(NSString *)path;
+(NSMutableArray<Question*>*) deserialiseFileAsArray:(NSString *)path;


-(NSString*) toNSString;

@end
