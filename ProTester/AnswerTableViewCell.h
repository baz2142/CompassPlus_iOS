//
//  AnswerTableViewCell.h
//  ProTester
//
//  Created by Nickita on 1/8/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel      *indexLabel;
@property (strong, nonatomic) IBOutlet UITextField  *answerTextField;

-(void)         setIndex:(size_t)index;
-(void)         setAnswerText:(NSString *)text;
-(NSString*)    getAnswerText;

- (IBAction)editingCellDidBegin:(UITextField *)sender;
- (IBAction)editingCellDidEnd:(UITextField *)sender;


@end
