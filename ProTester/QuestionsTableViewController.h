//
//  QuestionsTableViewController.h
//  ProTester
//
//  Created by Nickita on 1/4/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionEditorViewController.h"
#import "Question.h"

@interface QuestionsTableViewController: UITableViewController

@property (strong, nonatomic) NSMutableArray<Question*> *questions;

@property (strong, nonatomic) IBOutlet UIBarButtonItem *createNewButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *eraseAllButton;

- (IBAction)createNewPressed:(UIBarButtonItem *)sender;
- (IBAction)editPressed:(UIBarButtonItem *)sender;
- (IBAction)eraseAllPressed:(UIBarButtonItem *)sender;

- (void)updateControllWidgets;

@end
