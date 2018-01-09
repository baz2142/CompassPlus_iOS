//
//  QuestsViewController.h
//  ProTester
//
//  Created by Nickita on 1/2/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Question.h"

@interface QuestsViewController: UIViewController

@property (strong, nonatomic) NSMutableArray<Question*> *questions;

@end
