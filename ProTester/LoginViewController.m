//
//  LoginViewController.m
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) showQuestionsCollectionViewController
{
    QuestionsCollectionViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"QuestionsCollectionViewController"];
    
    [controller setupUserProfile:self.user];
    [self.navigationController pushViewController:controller animated:true];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginButtonDidPressed:(UIButton *)sender
{
    NSString * const name               = self.loginTextField.text;
    NSString * const userProfilePath    = [UserProfile getUserProfilePath:name];
    
    if (name == NULL || name.length == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wrong login name!"
                                                        message:@"Login name must have at least one character"
                                                       delegate:NULL
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:NULL];
        
        [alert show];
        return;
    }
    
    if (!self.user)
    {
        NSLog(@"Trying to deserialise %@ file", userProfilePath);
        
        self.user = [UserProfile deserialiseFileAsUserProfile:userProfilePath];
        
        if (!self.user)
            self.user = [[UserProfile alloc] init];
    }
    
    [self showQuestionsCollectionViewController];
}

- (IBAction)editingChanged:(UITextField *)sender
{
    const size_t len            = self.loginTextField.text.length;
    const bool lastCharIsSpace  = len > 0 && [self.loginTextField.text characterAtIndex:len - 1] == ' ';
    
    if (lastCharIsSpace)
        [self.loginTextField setText:[self.loginTextField.text substringToIndex:len - 1]];
}

@end
