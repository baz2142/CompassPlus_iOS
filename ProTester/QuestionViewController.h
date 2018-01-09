//
//  QuestionViewController.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestionViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView  *image;
@property (strong, nonatomic) IBOutlet UILabel      *questionText;
@property (strong, nonatomic) IBOutlet UITableView  *answersTable;

@property (strong, nonatomic) Question *question;

@end
