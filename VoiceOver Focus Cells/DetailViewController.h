//
//  DetailViewController.h
//  VoiceOver Focus Cells
//
//  Created by John Szumski on 3/31/15.
//  Copyright (c) 2015 John Szumski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UICollectionViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

