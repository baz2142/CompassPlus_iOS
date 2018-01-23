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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void) setupQuestionWithArray:(const NSMutableArray* const)quests atIndex:(size_t)index;
{
    self.questions  = quests;
    self.index      = index;
}

-(void) setupUIBasedOnQuestion
{
    [self.questionText setText:self.getCurrentQuestion.questionText];
    [self.answersTable reloadData];
    
    const size_t size   = self.questions.count;
    const bool isFirst  = self.index == 0;
    const bool isLast   = self.index == size - 1;
    
    [self.prevButton setEnabled:!isFirst];
    [self.nextButton setEnabled:!isLast];
    [self.navigationItem setTitle:[NSString stringWithFormat:@"A question #%zu", self.index + 1]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.getCurrentQuestion answers].count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    const size_t index = indexPath.row;
//    
//    NSLog(@"didSelectRowAtIndexPath at index = %lu", index);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Question view: cellForRowAtIndexPath");
    
    UITableViewCell     *cell   = [tableView dequeueReusableCellWithIdentifier:@"AnswerCell" forIndexPath:indexPath];
    const size_t        index   = indexPath.row;
    NSString* const     title   = [[[_questions objectAtIndex:self.index] answers] objectAtIndex:index];
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%lu. %@", index + 1, title]];
    
    return cell;
}

-(Question*) getCurrentQuestion
{
    return [self.questions objectAtIndex:self.index];
}

- (IBAction)nextButtonPressed:(UIButton *)sender
{
    self.index++;
    [self setupUIBasedOnQuestion];
}

- (IBAction)prevButtonPressed:(UIButton *)sender
{
    self.index--;
    [self setupUIBasedOnQuestion];
}

- (IBAction)confirmButtonPressed:(UIButton *)sender
{
    assert(self.user != NULL);
    assert(self.user.statistics != NULL);
    
    const NSArray<NSIndexPath*> *selected = [self.answersTable indexPathsForSelectedRows];
    NSMutableArray<NSNumber*>   *indeces  = [NSMutableArray new];
    
    for (NSIndexPath *index in selected)
        [indeces addObject:[NSNumber numberWithUnsignedInteger:index.row]];
    
    [indeces sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
    {
        NSNumber *a = obj1;
        NSNumber *b = obj2;
        
        return [a compare:b];
    }];
    
    [self.user addAnswer:indeces withIndex:self.index];
    
    NSLog(@"Confirm stat for %lu question", self.index);
    NSLog(@"Indeces = %@", [indeces debugDescription]);
    NSLog(@"Stat = %@", [self.user.statistics debugDescription]);
}

-(void) setupUser:(UserProfile*)userProfile
{
    assert(userProfile != NULL);
    
    self.user = userProfile;
}

@end
