//
//  QuestionEditorViewController.h
//  ProTester
//
//  Created by Nickita on 1/4/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "QuestionsTableViewController.h"
#import "AnswerTableViewCell.h"
#import "PictureCollectionViewController.h"


@interface QuestionEditorViewController: UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Question *question;
@property (strong, nonatomic) NSString *pictName;

@property (strong, nonatomic) IBOutlet UITextField *questionTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

-(void) setupPicture:(NSString*)pictName;
-(void) setupQuestion:(Question *)question;
-(void) fillUIBasedOnQuestion;
-(void) fillQuestionBasedOnUI;

- (IBAction)addAnswer:(UIBarButtonItem *)sender;

@end
