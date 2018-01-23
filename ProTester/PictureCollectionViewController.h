//
//  PictureCollectionViewController.h
//  ProTester
//
//  Created by Nickita on 1/22/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PictureCollectionViewCell.h"
#import "QuestionEditorViewController.h"

@interface PictureCollectionViewController : UICollectionViewController

@property (strong, nonatomic) NSMutableArray<NSString*>   *images;
@property (weak, nonatomic) UIImageView                   *imageView;

-(void) setupImageView:(UIImageView*)imgView;

@end
