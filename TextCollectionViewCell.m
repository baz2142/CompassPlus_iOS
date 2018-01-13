//
//  TextCollectionViewCell.m
//  ProTester
//
//  Created by Nickita on 1/12/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "TextCollectionViewCell.h"

@implementation TextCollectionViewCell

-(void) setupText:(const NSString * const)text;
{
    NSLog(@"Trying to set text!");
    [_textLabel setText:[text copy]];
}

@end
