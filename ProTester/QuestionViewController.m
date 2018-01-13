//
//  QuestionViewController.m
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()

@end

@implementation QuestionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUIBasedOnQuestion];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupQuestion: (const Question* const) quest
{
    _question = quest;
}

-(void) setupUIBasedOnQuestion
{
    [self.questionText setText:_question.getQuestionText];
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
    NSLog(@"Question view: cellForRowAtIndexPath");
    
    UITableViewCell *cell   = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    const size_t        index   = indexPath.row;
    NSString* const     title  = @"title";//[[_question answers] objectAtIndex:index];
    
    [cell.textLabel setText:title];
    //[cell setIndex:index]; //[NSString stringWithFormat: @"%lu. %@", index + 1, title];
    //[cell setAnswerText:title /*[[_question answers] objectAtIndex:index]*/];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
