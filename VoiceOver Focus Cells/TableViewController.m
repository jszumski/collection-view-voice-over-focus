//
//  TableViewController.m
//  VoiceOver Focus Cells
//
//  Created by John Szumski on 3/31/15.
//  Copyright (c) 2015 John Szumski. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.tableView.isAccessibilityElement = YES;
	self.tableView.accessibilityLabel = @"Table view accessiblity label";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
	
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
	}
	
	cell.isAccessibilityElement = YES;
	cell.accessibilityLabel = [NSString stringWithFormat:@"Custom accessibility label for cell number %li", (long)indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.row+1];
	
    return cell;
}

@end
