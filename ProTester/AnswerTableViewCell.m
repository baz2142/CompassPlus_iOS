//
//  AnswerTableViewCell.m
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "AnswerTableViewCell.h"

@implementation AnswerTableViewCell

-(void) awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

-(void) setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setupIndex:(size_t)index
{
    self.index = index;
    [_indexLabel setText: [NSString stringWithFormat:@"%lu.", index + 1]];
}

-(void) setupAnswerText:(NSString *)text
{
    [_answerTextField setText:text];
}

-(void) setIsCorrect:(bool)isCorrect
{
    [_isCorrectSwitcher setOn:isCorrect];
}

-(NSString *) getAnswerText
{
    return [_answerTextField.text copy];
}

-(IBAction) editingCellDidBegin:(UITextField *)sender
{
    [self setSelected:true];
}

-(IBAction) editingCellDidEnd:(UITextField *)sender
{
    [self setSelected:false];
    [self.answersArray setObject:[self getAnswerText] atIndexedSubscript:self.index];
    [self.isCorrectDict setObject:[NSNumber numberWithBool:self.isCorrect] forKey:[NSNumber numberWithUnsignedInt:self.index]];
}

-(void) setupAnswersArray:(NSMutableArray*)arr withIsCorrectDictionary:(NSMutableDictionary*)dict withIndex:(size_t)index;
{
    [self setupIndex:index];
    [self setupAnswerText: [arr objectAtIndex:index]];
    
    self.answersArray   = arr;
    self.isCorrectDict  = dict;
    
    [self.isCorrectSwitcher setOn:[[dict objectForKey:[NSNumber numberWithUnsignedInt:index]] boolValue]];
}

-(bool) isCorrect
{
    return [_isCorrectSwitcher isOn];
}

@end
