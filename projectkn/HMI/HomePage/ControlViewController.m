//
//  ControlViewController.m
//  projectkn
//
//  Created by xie minna on 14-2-8.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "ControlViewController.h"
#import "UILabelViewController.h"
#import "UIButtonViewController.h"
#import "UIImagetViewViewController.h"
#import "UIViewViewController.h"
#import "UIScrollViewController.h"
#import "UITableController.h"
#import "UITextFeildViewController.h"
#import "UISliderViewController.h"
#import "drawLineRectViewController.h"

@interface ControlViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *items;
}
@property (nonatomic,retain)NSArray *items;
@end

@implementation ControlViewController

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
    
    self.items = [[NSArray alloc] initWithObjects:@"标签（Label)",@"按钮（Button）", @"图片浏览（UIImageView）", @"视图（UIView）", @"滚动条(UIScrollView)", @"(列表)UITableView", @"(文本框)UITextFeild", @"滑动和音量(UISlider)", @"划线（drawRect）", nil];
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
    if (indexPath.row == 0) {
        UILabelViewController *lbLabel = [[UILabelViewController alloc] init];
        [self.navigationController pushViewController:lbLabel animated:YES];
    } else if (indexPath.row == 1) {
        UIButtonViewController *btnButton = [[UIButtonViewController alloc] init];
        [self.navigationController pushViewController:btnButton animated:YES];
    } else if (indexPath.row == 2){
        UIImagetViewViewController *imageView = [[UIImagetViewViewController alloc] init];
        [self.navigationController pushViewController:imageView animated:YES];
    } else if (indexPath.row == 3) {
        UIViewViewController *view = [[UIViewViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 4) {
        UIScrollViewController *scroll = [[UIScrollViewController alloc] init];
        [self.navigationController pushViewController:scroll animated:YES];
    } else if (indexPath.row == 5) {
        UITableController *tabele = [[UITableController alloc] init];
        [self.navigationController pushViewController:tabele animated:YES];
    } else if (indexPath.row == 6) {
        UITextFeildViewController *textFeild = [[UITextFeildViewController alloc] init];
        [self.navigationController pushViewController:textFeild animated:YES];
    } else if (indexPath.row == 7) {
        UISliderViewController *slider = [[UISliderViewController alloc] init];
        [self.navigationController pushViewController:slider animated:YES];
    } else if (indexPath.row == 8) {
        drawLineRectViewController *line = [[drawLineRectViewController alloc] init];
        [self.navigationController pushViewController:line animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
