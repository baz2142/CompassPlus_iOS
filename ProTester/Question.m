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
        _pictPath           = @"Picture path is undefied";
        _questionText       = @"Question text is undefined";
        _answers            = [[NSMutableArray alloc] init];
        _correctAnswerIndex = 666lu;
    }
    
    return self;
}

-(void) addAnswer:(NSString *)answer
{
    if (_answers != NULL)
        [_answers addObject: answer];
}

-(id) initWithCoder: (NSCoder*) coder
{
    if (self = [super init])
    {
        self.pictPath               = [coder decodeObjectForKey: @"picturePath"];
        self.questionText           = [coder decodeObjectForKey: @"questionText"];
        self.answers                = [coder decodeObjectForKey: @"answers"];
        self.correctAnswerIndex     = (size_t)[coder decodeInt64ForKey: @"correctAnswerIndex"];
    }
    else
        NSLog(@"Question inited with NULL!");
    
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

-(void) setCorrectAnswerIndex:(size_t)correctAnswerIndex
{
    _correctAnswerIndex = correctAnswerIndex;
}

-(void) encodeWithCoder: (NSCoder*) coder
{
    [coder encodeObject: self.pictPath              forKey: @"picturePath"];
    [coder encodeObject: self.questionText          forKey: @"questionText"];
    [coder encodeObject: self.answers               forKey: @"answers"];
    [coder encodeInt64:  self.correctAnswerIndex    forKey: @"correctAnswerIndex"];
}

-(NSString*) getPictPath;
{
    return _pictPath;
}

-(NSString*) getQuestionText
{
    return _questionText;
}

-(NSString*) getAnswerAtIndex: (size_t) index
{
    return _answers != NULL ? [_answers objectAtIndex: index] : NULL;
}

-(size_t) getCorrectAnswerIndex
{
    return _correctAnswerIndex;
}

+(void) serialiseArrayToFile: (NSMutableArray<Question*> *)array listFilePath: (NSString *) path;
{
    NSError *error = NULL;
    NSData  *plist = [NSKeyedArchiver archivedDataWithRootObject:array];
    
    if (!error)
    {
        bool ok = [plist writeToFile:path atomically:true];
        
        NSLog(ok ? @"Success serialisation!" : @"Error writing to file: %@", path);
    }
    else
        NSLog(@"Error: %@", error);
}

+(NSMutableArray<Question*>*) deserialiseFileAsArray: (NSString *) path;
{
    NSMutableArray<Question*> *array = [NSKeyedUnarchiver unarchiveObjectWithFile: path];
    
    NSLog(array ? @"Success derialisation!" : @"Deserialisation failed");
    
    return array;
}

-(NSString*) toNSString
{
    return [NSString stringWithFormat:@"Question:\nPicture path = %@\nQuestion Title = %@", _pictPath, _questionText];
}

@end
