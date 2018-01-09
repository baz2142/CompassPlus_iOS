//
//  QuestionEditorViewController.m
//  ProTester
//
//  Created by Nickita on 1/4/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "QuestionEditorViewController.h"

@interface QuestionEditorViewController ()

@end

@implementation QuestionEditorViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    
    NSLog(@"QuestionEditorViewController did load!");
    NSLog(@"%@", [_question toNSString]);
    [self fillUIBasedOnQuestion];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self fillQuestionBasedOnUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupQuestion:(Question *)question
{
    NSLog(@"QuestionEditorViewController setQuestion:(Question *)question");
    self.question = question;
}

-(void) fillUIBasedOnQuestion
{
    [self.picturePathTextField          setText:[_question getPictPath]];
    [self.questionTextField             setText:[_question getQuestionText]];
    [self.correctAnswerIndexTextField   setText:[NSString stringWithFormat:@"%lu", [_question getCorrectAnswerIndex]]];
    
}

-(void) fillQuestionBasedOnUI
{
    [self.question setPictPath:             self.picturePathTextField.text];
    [self.question setQuestionText:         self.questionTextField.text];
    [self.question setCorrectAnswerIndex:   [self.correctAnswerIndexTextField.text integerValue]];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"QuestionEditorViewController prepair for segue!");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;//[_question answers].count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    const size_t index = indexPath.row;
    
    NSLog(@"didSelectRowAtIndexPath at index = %lu", index);
    
    //[self updateControllWidgets];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Question editor: cellForRowAtIndexPath");
    
    AnswerTableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    const size_t        index   = indexPath.row;
    const NSString      *title  = @"title";//[[_question answers] objectAtIndex:index];
    
    [cell setIndex:index]; //[NSString stringWithFormat: @"%lu. %@", index + 1, title];
    [cell setAnswerText:title /*[[_question answers] objectAtIndex:index]*/];
    
    return cell;
}


@end
