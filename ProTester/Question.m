//
//  Question.m
//  ProTester
//
//  Created by Nickita on 1/2/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype) init
{
    if (self = [super init])
    {
        _pictPath               = @"A pictures path is undefied";
        _questionText           = @"A question text is undefined";
        _answers                = [[NSMutableArray alloc] init];
        _correctAnswersIndeces  = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

-(void) addAnswer:(nonnull NSString *)answer isCorrect:(bool)isCorrect
{
    assert(answer != NULL);
    
    if (_answers != NULL)
    {
        const size_t newIndex   = self.answers.count;
        NSNumber *nsIndex       = [NSNumber numberWithUnsignedInt:newIndex];
        NSNumber *nsBool        = [NSNumber numberWithBool:isCorrect];
        
        [_answers addObject: answer];
        [self.correctAnswersIndeces setObject:nsBool forKey:nsIndex];
    }
}

-(void) removeAnswerAtIndex:(size_t)index
{
    assert(index < self.answers.count);
    
    [self.answers removeObjectAtIndex:index];
    [self.correctAnswersIndeces removeObjectForKey:[NSNumber numberWithUnsignedInt:index]];
}

-(id) initWithCoder: (NSCoder*) coder
{
    if (self = [super init])
    {
        self.pictPath               = [coder decodeObjectForKey: @"picturePath"];
        self.questionText           = [coder decodeObjectForKey: @"questionText"];
        self.answers                = [coder decodeObjectForKey: @"answers"];
        self.correctAnswersIndeces  = [coder decodeObjectForKey: @"correctAnswersIndeces"];
    }
    else
        NSLog(@"The question inited with NULL!");
    
    return self;
}

-(void) setPictPath:(NSString *)pictPath
{
    _pictPath = [pictPath copy];
}

-(void) setQuestionText:(NSString *)questionText
{
    _questionText = [questionText copy];
}

-(void) encodeWithCoder: (NSCoder*) coder
{
    [coder encodeObject: self.pictPath                  forKey: @"picturePath"];
    [coder encodeObject: self.questionText              forKey: @"questionText"];
    [coder encodeObject: self.answers                   forKey: @"answers"];
    [coder encodeObject: self.correctAnswersIndeces     forKey: @"correctAnswersIndeces"];
}

-(NSString*) getPictPath;
{
    return _pictPath;
}

-(NSString*) getQuestionText
{
    return _questionText;
}

-(NSString*) getAnswerAtIndex: (size_t)index
{
    return _answers != NULL ? [_answers objectAtIndex:index] : NULL;
}


+(void) serialiseArrayToFile:(NSMutableArray<Question*> *)array listFilePath:(NSString *)path;
{
    NSError *error = NULL;
    NSData  *plist = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    if (!error)
    {
        bool ok = [plist writeToFile:path atomically:true];
        
        NSLog(ok ? @"Success serialisation!" : @"Error writing to the file: %@", path);
    }
    else
        NSLog(@"Error: %@", error);
}

+(NSMutableArray<Question*>*) deserialiseFileAsArray:(const NSString *)path;
{
    NSMutableArray<Question*> *array = [NSKeyedUnarchiver unarchiveObjectWithFile:[path copy]];
    
    NSLog(array ? @"Success derialisation!" : @"Deserialisation have failed");
    
    return array;
}

-(NSString*) toNSString
{
    return [NSString stringWithFormat:@"Question:\nPicture path = %@\nQuestion Title = %@", _pictPath, _questionText];
}

@end
