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

@property (nonatomic) size_t                    index;
@property (strong, nonatomic) NSMutableArray    *answersArray;

-(void)         setupAnswersArray: (size_t)index array:(NSMutableArray*)arr;
-(void)         setupIndex:(size_t)index;
-(void)         setupAnswerText:(NSString *)text;
-(NSString*)    getAnswerText;

-(IBAction) editingCellDidBegin:(UITextField *)sender;
-(IBAction) editingCellDidEnd:(UITextField *)sender;


@end
