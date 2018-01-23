//
//  PictureCollectionViewCell.m
//  ProTester
//
//  Created by Nickita on 1/22/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "PictureCollectionViewCell.h"

@implementation PictureCollectionViewCell

-(void) awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}


-(void) setupPicture:(NSString*)pictName
{
    NSLog(@"Trying to set a picture %@", pictName);
    self.picture = pictName.copy;
    [self.imageView setImage:[UIImage imageNamed:pictName]];
}

@end
