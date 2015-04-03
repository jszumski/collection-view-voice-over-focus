//
//  MasterViewController.m
//  VoiceOver Focus Cells
//
//  Created by John Szumski on 3/31/15.
//  Copyright (c) 2015 John Szumski. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TableViewController.h"

@implementation MasterViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
	    self.clearsSelectionOnViewWillAppear = NO;
	    self.preferredContentSize = CGSizeMake(320.0, 600.0);
	}
}

- (void)viewDidLoad {
	[super viewDidLoad];

	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	
	if (indexPath.row == 0) {
		cell.textLabel.text = @"Collection View";
		
	} else {
		cell.textLabel.text = @"Table View";
	}
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.row == 0) {
		[self.navigationController pushViewController:[[DetailViewController alloc] init] animated:YES];
		
	} else {
		[self.navigationController pushViewController:[[TableViewController alloc] init] animated:YES];
	}
}

@end
