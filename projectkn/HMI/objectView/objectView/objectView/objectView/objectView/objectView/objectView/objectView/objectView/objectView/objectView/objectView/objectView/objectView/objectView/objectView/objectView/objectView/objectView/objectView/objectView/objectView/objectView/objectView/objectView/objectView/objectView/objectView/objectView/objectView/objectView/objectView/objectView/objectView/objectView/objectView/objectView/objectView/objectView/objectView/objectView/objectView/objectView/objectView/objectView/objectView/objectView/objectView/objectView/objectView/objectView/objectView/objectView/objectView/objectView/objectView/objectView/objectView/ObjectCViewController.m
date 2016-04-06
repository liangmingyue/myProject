//
//  ObjectCViewController.m
//  projectkn
//
//  Created by xie minna on 14-8-20.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "ObjectCViewController.h"
#import "NSStringViewController.h"
#import "GestureViewController.h"
#import "NSarrayViewController.h"
#import "CABasicAnimationViewController.h"

@interface ObjectCViewController ()
{
    NSArray *items;
}
@property (nonatomic,retain)NSArray *items;

@end

@implementation ObjectCViewController

- (void)viewDidLoad
{
    self.title = @"控件页面";
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
	// Do any additional setup after loading the view, typically from a nib.
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.items = [[NSArray alloc] initWithObjects:@"NSString",@"手势",@"数组", @"动画",nil];
    //    [self UILableStudy];
    
	// Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - TableView Methods
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            NSStringViewController *nstring = [[NSStringViewController alloc] init];
            [self.navigationController pushViewController:nstring animated:YES];
        }
            break;
        case 1:
        {
            GestureViewController *gesture = [[GestureViewController alloc] init];
            [self.navigationController pushViewController:gesture animated:YES];
        }
            break;
        case 2:
        {
            NSarrayViewController *array = [[NSarrayViewController alloc] init];
            [self.navigationController pushViewController:array animated:YES];
        }
            break;
        case 3:
        {
            CABasicAnimationViewController *animation = [[CABasicAnimationViewController alloc] init];
            [self.navigationController pushViewController:animation animated:YES];
        }
            break;
        default:
            break;
    }
    
    if (indexPath.row == 0) {

    } else if (indexPath.row == 1) {

    } else if (indexPath.row == 2) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
