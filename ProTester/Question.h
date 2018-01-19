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

@property (strong, nonatomic) NSString                                      *pictPath;
@property (strong, nonatomic) NSString                                      *questionText;
@property (strong, nonatomic) NSMutableArray<NSString*>                     *answers;
@property (strong, nonatomic) NSMutableDictionary<NSNumber*, NSNumber*>     *correctAnswersIndeces;

-(void) addAnswer:(NSString *)answer isCorrect:(bool)isCorrect;
-(void) removeAnswerAtIndex:(size_t)index;
-(void) encodeWithCoder:(NSCoder*)coder;

-(void) setPictPath:(NSString *)pictPath;
-(void) setQuestionText:(NSString *)questionText;

-(id) initWithCoder: (NSCoder*) coder;

-(NSString*)    getPictPath;
-(NSString*)    getQuestionText;
-(NSString*)    getAnswerAtIndex: (size_t)index;

+(void) serialiseArrayToFile:(NSMutableArray<Question*>*)array listFilePath:(NSString *)path;
+(NSMutableArray<Question*>*) deserialiseFileAsArray:(const NSString *)path;


-(NSString*) toNSString;

@end
