//
//  QuestionsCollectionViewController.m
//  ProTester
//
//  Created by Nickita on 1/12/18.
//  Copyright © 2018 Nickita. All rights reserved.
//

#import "QuestionsCollectionViewController.h"

@interface QuestionsCollectionViewController ()

@end

@implementation QuestionsCollectionViewController

static NSString* const reuseIdentifier = @"Cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    const NSString *questionsPlistFilePath = [root stringByAppendingString:questionsPlistName];
    _questions = [Question deserialiseFileAsArray:questionsPlistFilePath];
    
    if (_questions == nil)
        NSLog(@"QuestionsCollectionViewController: questions = nil!");
}

-(void) viewWillAppear:(BOOL)animated
{
    [self.collectionView reloadData];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSString *pathPattern = [root stringByAppendingString:usersPattern];
    
    [self.user serialiseUserProfileToFile:[NSString stringWithFormat:pathPattern, self.user.loginName]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    const NSIndexPath       *indexPath  = [[self.collectionView indexPathsForSelectedItems] objectAtIndex:0];
    const size_t            index       = indexPath.row;
    QuestionViewController  *controller = [segue destinationViewController];
    
    NSLog(@"Selected cell at index = %lu", index);
    
    [controller setupQuestionWithArray:self.questions atIndex:index];
    [controller setupUser:self.user];
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _questions.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    const size_t            index       = indexPath.row;
    TextCollectionViewCell  *cell       = (TextCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSString* const         text        = [NSString stringWithFormat:@"%lu", index + 1];
    const enum CellStat     cellStatus  = [self getStatusForCellAtIndex:index];
    
    [cell setupText:text];
    
    if (cellStatus != CELL_STAT_UNAVAIBLE)
        [cell setBackgroundColor: cellStatus == CELL_STAT_CORRECT ? UIColor.greenColor : UIColor.redColor];
    else
    {
        NSLog(@"Cell %lu haven't stat", index);
        [cell setBackgroundColor:UIColor.whiteColor];
    }
    
    return cell;
}

-(void) setupUserProfile:(UserProfile*)userProfile
{
    assert(userProfile != NULL);
    
    self.user = userProfile;
}

-(enum CellStat) getStatusForCellAtIndex:(size_t)index
{
    const bool isStatExists = [self.user isStatisticsForQuestionAtIndexExists:index];
    
    if (!isStatExists)
        return CELL_STAT_UNAVAIBLE;
    else
    {
        const Question *quest  = [self.questions objectAtIndex:index];
        const NSMutableArray<NSNumber*> *correctIndeces = [quest getCorrectIndeces];
        const NSMutableArray<NSNumber*> *statistics     = [self.user getStatisticsForQuestionAtIndex:index];
        
        bool (^isArraysContentEqual)(const NSMutableArray*, const NSMutableArray*) = ^bool(const NSMutableArray *a, const NSMutableArray *b)
        {
            const size_t size = a.count;
            
            if (b.count != size)
                return false;
            
            NSLog(@"Array #1:");
            for (size_t i = 0; i < size; ++i)
                NSLog(@"%lu", (unsigned long)[[a objectAtIndex:i] unsignedIntegerValue]);
            
            NSLog(@"Array #2:");
            for (size_t i = 0; i < size; ++i)
                NSLog(@"%lu", (unsigned long)[[b objectAtIndex:i] unsignedIntegerValue]);
            
            for (size_t i = 0; i < size; ++i)
                if (![[a objectAtIndex:i] isEqual:[b objectAtIndex:i]])
                    return false;
            
            return true;
        };
        
        return isArraysContentEqual(correctIndeces, statistics) ? CELL_STAT_CORRECT : CELL_STAT_INCORRECT;
    }
}

#pragma mark <UICollectionViewDelegate>



@end
