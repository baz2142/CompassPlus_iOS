//
//  QuestionViewController.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"
#import "UserProfile.h"

@interface QuestionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView  *image;
@property (strong, nonatomic) IBOutlet UILabel      *questionText;
@property (strong, nonatomic) IBOutlet UITableView  *answersTable;
@property (strong, nonatomic) IBOutlet UIButton     *prevButton;
@property (strong, nonatomic) IBOutlet UIButton     *nextButton;

@property (strong, nonatomic) UserProfile           *user;
@property (strong, nonatomic) const NSMutableArray  *questions;
@property (nonatomic) size_t                        index;

-(void) setupQuestionWithArray:(const NSMutableArray* const)quests atIndex:(size_t)index;
-(void) setupUIBasedOnQuestion;
-(void) setupUser:(UserProfile*)userProfile;

-(Question*) getCurrentQuestion;

- (IBAction)nextButtonPressed:(UIButton *)sender;
- (IBAction)prevButtonPressed:(UIButton *)sender;
- (IBAction)confirmButtonPressed:(UIButton *)sender;

@end
