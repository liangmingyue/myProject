//
//  CABasicAnimationViewController.m
//  projectkn
//
//  Created by xie minna on 14-10-31.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()

@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"动画";
    //http://shiminghua234.blog.163.com/blog/static/26391242201341633018353/
    // Do any additional setup after loading the view.
    /*  动画的开始与结束的快慢,有五个预置分别为(下同):
    *  kCAMediaTimingFunctionLinear            线性,即匀速
    *  kCAMediaTimingFunctionEaseIn            先慢后快
    *  kCAMediaTimingFunctionEaseOut           先快后慢
    *  kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
    *  kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
    */
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
