//
//  EverNoteLayout.m
//  EvernoteEffect
//
//  Created by Sungwhee Kim on 14-3-30.
//  Copyright (c) 2014年 Sungwhee Kim. All rights reserved.
//

#import "EverNoteLayout.h"

@implementation EverNoteLayout

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    
    return YES;
}

- (UICollectionViewScrollDirection)scrollDirection {
    
    return UICollectionViewScrollDirectionVertical;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    
    UICollectionView *collectionView = [self collectionView];
    UIEdgeInsets insets = [collectionView contentInset];
    CGPoint offset = [collectionView contentOffset];
    CGFloat minY = -insets.top;
    
    NSArray *attrsArray = [super layoutAttributesForElementsInRect:rect];
    
    if (offset.y < minY) {
        
        CGSize  headerSize = [self headerReferenceSize];
        CGFloat deltaY = fabsf(offset.y - minY);
        
        for (UICollectionViewLayoutAttributes *attrs in attrsArray) {
            
            if ([attrs representedElementKind] == UICollectionElementKindSectionHeader) {
                
                CGRect headerRect = [attrs frame];
                headerRect.size.height = MAX(minY, headerSize.height + deltaY);
                headerRect.origin.y = headerRect.origin.y - deltaY + deltaY* attrs.indexPath.section;;
                [attrs setFrame:headerRect];
            }
            if ([attrs representedElementKind] == UICollectionElementCategoryCell) {
                CGRect headerRect = [attrs frame];
                headerRect.origin.y = headerRect.origin.y  + deltaY * attrs.indexPath.section;
                [attrs setFrame:headerRect];
            }
        }
    }
    
    return attrsArray;
}

@end
