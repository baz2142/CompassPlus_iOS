//
//  QuestionViewController.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UIImageView  *image;
@property (strong, nonatomic) IBOutlet UILabel      *questionText;
@property (strong, nonatomic) IBOutlet UITableView  *answersTable;

@property (strong, nonatomic) const Question *question;

-(void) setupQuestion: (const Question* const) quest;
-(void) setupUIBasedOnQuestion;

@end
