//
//  ViewController.m
//  EvernoteEffect
//
//  Created by Sungwhee Kim on 14-3-30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "ViewController.h"
#import "EverNoteLayout.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) EverNoteLayout * evernoteLayout;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.evernoteLayout = [[EverNoteLayout alloc] init];
    [self.evernoteLayout setSectionInset:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.evernoteLayout setItemSize:CGSizeMake(300.0, 40.0)];
    [self.evernoteLayout setHeaderReferenceSize:CGSizeMake(320.0, 20.0)];
    
    self.collectionView.collectionViewLayout = self.evernoteLayout;
    
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView setAlwaysBounceVertical:YES];
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    
    [self.collectionView registerClass:[UICollectionViewCell class]
       forCellWithReuseIdentifier:@"Cell"];
    
    [self.collectionView registerClass:[UICollectionReusableView class]
       forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
              withReuseIdentifier:@"HeadCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)cv {
    
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)cv numberOfItemsInSection:(NSInteger)section {
    
    return 2;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)cv viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    //    if (!header) {
    
    UICollectionReusableView *  header = [self.collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                            withReuseIdentifier:@"HeadCell"
                                                                                   forIndexPath:indexPath];
    header.backgroundColor = [UIColor clearColor];
    return header;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell;
    cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                     forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    UILabel * label = [[UILabel alloc] initWithFrame:cell.bounds];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setNumberOfLines:0];
    [label setText:[NSString stringWithFormat:@"cell section:%d index:%d",indexPath.section,indexPath.row]];
    label.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:label];
    
    return cell;
}
@end
