//
//  LoginViewController.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserProfile.h"
#import "Common.h"
#import "QuestionsCollectionViewController.h"

@interface LoginViewController: UIViewController

@property (strong, nonatomic) IBOutlet UITextField  *loginTextField;
@property (strong, nonatomic) IBOutlet UIButton     *loginButton;

@property (strong, nonatomic) UserProfile *user;

-(void) showQuestionsCollectionViewController;

- (IBAction)loginButtonDidPressed:(UIButton *)sender;
- (IBAction)editingChanged:(UITextField *)sender;

@end
