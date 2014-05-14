//
//  CustomTableViewController.m
//  tableProject
//
//  Created by Dana Adylova on 5/14/14.
//  Copyright (c) 2014 Dana Adylova. All rights reserved.
//
// This class shows how to make TableView from normal view [adding table view on top of the view]

#import "CustomTableViewController.h"

// We put conforms here because it does not need to be publc. I can put it into .h file. dataSource and Delegate are two protocols that ViewController supports. After adding those two protocols, xcode checks the methods for table out.
@interface CustomTableViewController () <UITableViewDataSource, UITableViewDelegate>;

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *coloursArray;

@end

@implementation CustomTableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain]; // How big it should be/ style
    [self.view addSubview:self.tableView]; // adding this table to the total screen
    self.coloursArray = @[@"Red", @"Orange", @"Green", @"Gray", @"Black", @"Yellow", @"Light purple", @"Blue", @"Light blue", @"Dark blue"];
    self.tableView.dataSource = self; // Get all files from us.
    self.tableView.delegate = self; // Put all files to us.
    [self.view setBackgroundColor:[UIColor greenColor]];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
//    self.tableView.frame = self.view.bounds; // make the table size full size of the screen. Bounce represents
//    self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height); // This is the same as the line before
      self.tableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height/2); // This creates table on half of the screen

}

// It is going to give us a cell at this specific indexpath (in thos case indexpath.row)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColourIdentifier"]; // String is an identifier for different types of cells
    if (!cell) // cell == mil
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ColourIdentifier"]; // Default style of the cell. We use the same Identifier.
    }
    cell.textLabel.text = self.coloursArray[indexPath.row];
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.coloursArray count];
}

@end
