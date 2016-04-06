//
//  drawLineRectViewController.m
//  projectkn
//
//  Created by xie minna on 15-3-18.
//  Copyright (c) 2015年 xie minna. All rights reserved.
//

#import "drawLineRectViewController.h"

@interface drawLineRectViewController ()

@end

@implementation drawLineRectViewController

- (id)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //http://www.cnblogs.com/wendingding/p/3782489.html
    // http://www.chengxuyuans.com/Android/62527.html
    drawLineView *line = [[drawLineView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
