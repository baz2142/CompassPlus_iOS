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
    
    //[self setupPicture:@"android-win-2-300x162.png"];
    
//    UILabel *header = [UILabel new];
//    [header setText:@"Answers 123"];
//    
//    [_tableView setTableHeaderView:header];
    
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
}

-(void) setupQuestion:(Question *)question
{
    self.question = question;
    
    if (!question.answers)
        question.answers = [[NSMutableArray alloc] init];
}

-(void) fillUIBasedOnQuestion
{
    [self setupPicture:[_question getPictPath]];
    [self.questionTextField setText:[_question getQuestionText]];
}

-(void) setupPicture:(NSString*)pictName
{
    [self.imageView setImage:[UIImage imageNamed:pictName]];
    self.pictName = pictName.copy;
    //[self.question setPictPath:pictName];
}

-(void) fillQuestionBasedOnUI
{
    [self.question setPictPath:     self.pictName];
    [self.question setQuestionText: self.questionTextField.text];
}

- (IBAction)addAnswer:(UIBarButtonItem *)sender
{
    const size_t            index           = self.question.answers.count;
    NSIndexPath             *indexPath      = [NSIndexPath indexPathForRow:index inSection:0];
    NSArray<NSIndexPath*>   *indexArray     = [[NSArray alloc] initWithObjects:indexPath, NULL];
    AnswerTableViewCell     *cell           = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self.question addAnswer:@"An undefined answer" isCorrect:cell.isCorrect];
    [self.tableView insertRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationFade];
    //[self.tableView reloadData];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    PictureCollectionViewController *controller = segue.destinationViewController;
    [controller setupImageView:self.imageView];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"QnumberOfRowsInSection!");
    return self.question.answers == NULL ? 0 : self.question.answers.count;
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
    
    [cell setupAnswersArray:self.question.answers withIsCorrectDictionary:self.question.correctAnswersIndeces withIndex:index];
    
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return true;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    const size_t index = indexPath.row;
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        NSLog(@"Delete!!");
        
        [self.question.answers removeObjectAtIndex:index];
        [self.tableView deleteRowsAtIndexPaths:[[NSArray alloc] initWithObjects:indexPath, nil] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
