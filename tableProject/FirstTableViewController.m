//
//  FirstTableViewController.m
//  tableProject
//
//  Created by Dana Adylova on 5/14/14.
//  Copyright (c) 2014 Dana Adylova. All rights reserved.
//

#import "FirstTableViewController.h"

@interface FirstTableViewController ()

@property (strong, nonatomic) NSArray *coloursArray;

@end


@implementation FirstTableViewController

- (void)viewDidLoad
{
    self.coloursArray = @[@"Red", @"Orange", @"Green", @"Gray", @"Black", @"Yellow", @"Light purple", @"Blue", @"Light blue", @"Dark blue"];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.

    return [self.coloursArray count];
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

@end
