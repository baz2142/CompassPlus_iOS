//
//  TextCollectionViewCell.h
//  ProTester
//
//  Created by Nickita on 1/12/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextCollectionViewCell: UICollectionViewCell

@property (strong, nonatomic) IBOutlet UILabel *textLabel;

-(void) setupText:(const NSString * const)text;

@end
