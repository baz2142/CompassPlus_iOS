//
//  PictureCollectionViewCell.h
//  ProTester
//
//  Created by Nickita on 1/22/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic, nonnull) NSString             *picture;
@property (strong, nonatomic, nonnull) IBOutlet UIImageView *imageView;

-(void) setupPicture:(nonnull NSString*)pictName;

@end
