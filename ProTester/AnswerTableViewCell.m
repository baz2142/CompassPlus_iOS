//
//  AnswerTableViewCell.m
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "AnswerTableViewCell.h"

@implementation AnswerTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setIndex:(size_t)index
{
    [_indexLabel setText: [NSString stringWithFormat:@"%lu.", index]];
}

-(void) setAnswerText:(NSString *)text
{
    [_answerTextField setText:text];
}

-(NSString*) getAnswerText
{
    return [_answerTextField.text copy];
}

- (IBAction)editingCellDidBegin:(UITextField *)sender
{
    [self setSelected:true];
}

- (IBAction)editingCellDidEnd:(UITextField *)sender
{
    [self setSelected:false];
}

@end
