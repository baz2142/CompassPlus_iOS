//
//  QuestionsTableViewController.m
//  ProTester
//
//  Created by Nickita on 1/4/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "QuestionsTableViewController.h"

@interface QuestionsTableViewController ()

@end

@implementation QuestionsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"QuestionsTableViewController did load!");
    _questions = [Question deserialiseFileAsArray:questionsPlistPath];
    
    if (!_questions)
    {
        NSLog(@"Questions are invalid or doesn't exists, creating empty");
        _questions = [[NSMutableArray alloc]init];
    }
    
    for (Question *q in _questions)
        NSLog(@"%@", [q toNSString]);
    
    [self updateControllWidgets];
}

- (void) viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void) viewDidDisappear:(BOOL)animated
{
    NSLog(@"QuestionsTableViewController viewDidDisappear: trying to save the array.");
    [Question serialiseArrayToFile:_questions listFilePath:questionsPlistPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _questions.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    const size_t index = indexPath.row;
    
    NSLog(@"didSelectRowAtIndexPath at index = %lu", index);
    
    [self updateControllWidgets];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell     *cell   = [tableView dequeueReusableCellWithIdentifier:@"QuestionCell" forIndexPath:indexPath];
    const size_t        index   = indexPath.row;
    const NSString      *title  = [[_questions objectAtIndex:index] getQuestionText];
    
    cell.textLabel.text = [NSString stringWithFormat: @"%lu. %@", index + 1, title];
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    const QuestionEditorViewController  *controller = [segue destinationViewController];
    const NSIndexPath                   *indexPath  = [self.tableView indexPathForSelectedRow];
    const size_t                        row         = (size_t)indexPath.row;
    
    NSLog(@"Setting up question, index = %lu", row);
    Question *question = [_questions objectAtIndex:row];
    
    NSLog(@"Passing to controller");
    [controller setupQuestion:question];
}

- (IBAction)createNewPressed:(UIBarButtonItem *)sender
{
    NSLog(@"Trying to creating a new question");
    [_questions addObject: [[Question alloc] init]];
    
    NSLog(@"Total questions count = %lu", (size_t)_questions.count);
    for (Question *q in _questions)
        NSLog(@"%@", [q toNSString]);
    
    [self.tableView reloadData];
}

- (IBAction)editPressed:(UIBarButtonItem *)sender
{
    NSLog(@"Edit button pressed!");
    
    [self updateControllWidgets];
}

- (IBAction)deletePressed:(UIBarButtonItem *)sender
{
    const NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if (indexPath == nil)
    {
        NSLog(@"Deleting denied");
        return;
    }
    
    const size_t row = (size_t)indexPath.row;
    
    NSLog(@"Trying to remove question at index %lu\n%@", row, [[_questions objectAtIndex:row] toNSString]);
    [_questions removeObjectAtIndex:row];
    
    [self.tableView reloadData];
    [self updateControllWidgets];
}

- (IBAction)eraseAllPressed:(UIBarButtonItem *)sender
{
    NSLog(@"Erasing all");
    
    [_questions removeAllObjects];
    [self.tableView reloadData];
    [self.eraseAllButton setEnabled:false];
}

- (void)updateControllWidgets
{
    const NSIndexPath   *indexPath          = [self.tableView indexPathForSelectedRow];
    const bool          isAnyCellSelected   = indexPath != nil;
    const size_t        index               = isAnyCellSelected ? indexPath.row : 0lu;

    const bool editEnabled      = isAnyCellSelected && index < _questions.count;
    const bool deleteEnabled    = isAnyCellSelected && index < _questions.count;
    const bool eraseAllEnabled  = _questions.count != 0;
    
    [_createNewButton   setEnabled:true];
    [_editButton        setEnabled:editEnabled];
    [_deleteButton      setEnabled:deleteEnabled];
    [_eraseAllButton    setEnabled:eraseAllEnabled];
}

@end
