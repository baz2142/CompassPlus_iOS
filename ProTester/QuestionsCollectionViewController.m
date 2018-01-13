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
    //[self.collectionView registerClass:[UICollectionViewController class] forCellWithReuseIdentifier:@"Cell"];
    
    _questions = [Question deserialiseFileAsArray:questionsPlistPath];
    
    if (_questions == nil)
        NSLog(@"QuestionsCollectionViewController: questions = nil!");
    
    // Do any additional setup after loading the view.
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
    const Question* const   question    = [_questions objectAtIndex:index];
    
    NSLog(@"Selected cell at index = %lu", index);
    
    [controller setupQuestion:question];
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
    const size_t            index  = indexPath.row;
    TextCollectionViewCell  *cell  = (TextCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    NSString* const         text   = [NSString stringWithFormat:@"%lu", index];
    
    //[cell.textLabel setText:text];
    [cell setupText:text];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
