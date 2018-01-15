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
@property (strong, nonatomic) IBOutlet UISwitch     *isCorrectSwitcher;

@property (nonatomic) size_t                        index;
@property (strong, nonatomic) NSMutableArray        *answersArray;
@property (strong, nonatomic) NSMutableDictionary   *isCorrectDict;


-(void)         setupAnswersArray:(NSMutableArray*)arr withIsCorrectDictionary:(NSMutableDictionary*)dict withIndex:(size_t)index;
-(void)         setupIndex:(size_t)index;
-(void)         setupAnswerText:(NSString *)text;
-(void)         setIsCorrect:(bool)isCorrect;
-(bool)         isCorrect;
-(NSString*)    getAnswerText;

-(IBAction) editingCellDidBegin:(UITextField *)sender;
-(IBAction) editingCellDidEnd:(UITextField *)sender;


@end
