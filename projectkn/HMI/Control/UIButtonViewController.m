//
//  UIButtonViewController.m
//  projectkn
//
//  Created by xie minna on 14-2-25.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UIButtonViewController.h"

@interface UIButtonViewController ()

@end

@implementation UIButtonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(30, 360, 90, 35);
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"ZoomIn11111111111111" forState:UIControlStateNormal];
    [btn setTitle:@"ZoomIn" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    [btn setContentVerticalAlignment:UIControlContentVerticalAlignmentTop];
    [btn setTitleShadowColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(zoomInAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
	// Do any additional setup after loading the view.
    
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,1,0,0,1);
    CGContextMoveToPoint(context,150,50);
    CGContextAddLineToPoint(context,100,80);
    CGContextAddLineToPoint(context,130,150);
}

- (void)zoomInAction:(id)sender
{
//    [btn setFrame:CGRectMake(30, 100, 90, 50)];
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=General"]];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
