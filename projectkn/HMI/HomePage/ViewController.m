//
//  ViewController.m
//  studyPro
//
//  Created by xie minna on 14-2-8.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "ViewController.h"
#import "ControlViewController.h"
#import "ObjectCViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *items;
}
@property (nonatomic,retain)NSArray *items;
@end

@implementation ViewController

- (void)viewDidLoad
{
    self.title = @"主页";
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
	// Do any additional setup after loading the view, typically from a nib.
    UITableView *table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    table.dataSource = self;
    table.delegate = self;
    [self.view addSubview:table];
    self.view.backgroundColor = [UIColor grayColor];
    
    self.items = [[NSArray alloc] initWithObjects:@"控件",@"object-c",nil];
    
    
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
        ControlViewController *vc = [[ControlViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 1) {
        ObjectCViewController *obj = [[ObjectCViewController alloc] init];
        [self.navigationController pushViewController:obj animated:YES];
    }
}

-(void)UILableStudy
{
    UILabel *lbMyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    lbMyLabel.backgroundColor = [UIColor whiteColor];
    lbMyLabel.textColor = [UIColor purpleColor];
    lbMyLabel.text = @"我是。。。。";
    //设置文字位置
    lbMyLabel.textAlignment = NSTextAlignmentCenter;
    lbMyLabel.font  = [UIFont boldSystemFontOfSize:20];
    //设置字体大小适应label宽度
    lbMyLabel.adjustsFontSizeToFitWidth = YES;
    lbMyLabel.numberOfLines = 2;
    //设置高亮
    lbMyLabel.highlighted = YES;
    lbMyLabel.highlightedTextColor = [UIColor orangeColor];
    //设置高亮
    lbMyLabel.shadowColor = [UIColor redColor];
    lbMyLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    //设置是否能与用户进行交互
    lbMyLabel.userInteractionEnabled = YES;
    //设置label中的文字是否可变，默认值是YES
    lbMyLabel.enabled = NO;
    //设置文字过长时的显示格式
    lbMyLabel.lineBreakMode = UILineBreakModeMiddleTruncation;//截去中
    //  typedef enum {
    //      UILineBreakModeWordWrap = 0,
    //      UILineBreakModeCharacterWrap,
    //      UILineBreakModeClip,//截去多余部分
    //      UILineBreakModeHeadTruncation,//截去头部
    //      UILineBreakModeTailTruncation,//截去尾部
    //      UILineBreakModeMiddleTruncation,//截去中间
    //  } UILineBreakMode;
    [self.view addSubview:lbMyLabel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
