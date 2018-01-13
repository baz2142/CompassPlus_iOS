//
//  QuestionsCollectionViewController.h
//  ProTester
//
//  Created by Nickita on 1/12/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TextCollectionViewCell.h"
#import "Question.h"

@interface QuestionsCollectionViewController: UICollectionViewController

@property (strong, nonatomic) const NSMutableArray<Question*> *questions;

@end
