//
//  DetailViewController.m
//  VoiceOver Focus Cells
//
//  Created by John Szumski on 3/31/15.
//  Copyright (c) 2015 John Szumski. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewControllerCarouselLayout : UICollectionViewFlowLayout

@end


@implementation DetailViewControllerCarouselLayout

- (instancetype)init {
	self = [super init];
	
	self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
	self.minimumInteritemSpacing = 8.0f;
	
	return self;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {
	CGFloat proposedContentOffsetCenterX = proposedContentOffset.x + self.collectionView.bounds.size.width * 0.5f;
	CGRect proposedRect = self.collectionView.bounds;
	
	UICollectionViewLayoutAttributes* candidateAttributes;
	for (UICollectionViewLayoutAttributes* attributes in [self layoutAttributesForElementsInRect:proposedRect]) {
		
		// skip comparison with non-cell items (headers and footers)
		if (attributes.representedElementCategory != UICollectionElementCategoryCell) {
			continue;
		}
		
		// first time in the loop
		if (!candidateAttributes) {
			candidateAttributes = attributes;
			continue;
		}
		
		if (fabsf(attributes.center.x - proposedContentOffsetCenterX) < fabsf(candidateAttributes.center.x - proposedContentOffsetCenterX)) {
			candidateAttributes = attributes;
		}
	}
	
	return CGPointMake(candidateAttributes.center.x - self.collectionView.bounds.size.width * 0.5f, proposedContentOffset.y);
}

@end


#pragma mark -


@implementation DetailViewController

- (instancetype)init {
	return [super initWithCollectionViewLayout:[[DetailViewControllerCarouselLayout alloc] init]];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.collectionView.backgroundColor = [UIColor colorWithWhite:0.945 alpha:1.0];
	self.collectionView.showsHorizontalScrollIndicator = NO;
	self.collectionView.contentInset = UIEdgeInsetsZero;
	self.collectionView.isAccessibilityElement = YES;
	self.collectionView.accessibilityLabel = @"Collection view accessiblity label";
	
	[self.collectionView registerClass:[UICollectionViewCell class]
			forCellWithReuseIdentifier:@"cell"];
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return 10;
}


#pragma mark - UICollectionViewDelegate

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
	cell.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0];
	cell.accessibilityLabel = [NSString stringWithFormat:@"Custom accessibility label for cell number %li", (long)indexPath.row];
	cell.isAccessibilityElement = YES;
	
	return cell;
}


#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)c layout:(UICollectionViewLayout *)l sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(CGRectGetWidth(c.bounds) - 30,
					  CGRectGetHeight(c.bounds) - 200);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)c layout:(UICollectionViewLayout *)l insetForSectionAtIndex:(NSInteger)section {
	return UIEdgeInsetsMake(22, 22, 22, 22);
}

@end
