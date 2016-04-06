//
//  UIViewViewController.m
//  projectkn
//
//  Created by xie minna on 14-8-20.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UIViewViewController.h"

@interface UIViewViewController ()

@end

@implementation UIViewViewController

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
    
// 在做IOS客户端（iPad、iPhone……）与服务端进行交互时，要进行网络连接，而且一般进行相互交互时都会有一定的时间，这时如果能在状态栏显示和隐藏网络活动标志，这样会有更好的客户体验。
    //在向服务端发送请求状态栏显示网络活动标志：
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    //这里是发送服务端请求的代码
    //请求结束状态栏隐藏网络活动标志：
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
    //状态栏的隐藏和显示 http://www.molotang.com/articles/1609.html
    //从UIApplication.h中，我们看来看去也就这么3个和状态栏的隐藏有关：
//    @property(nonatomic,getter=isStatusBarHidden) BOOL statusBarHidden;
//    - (void)setStatusBarHidden:(BOOL)hidden withAnimation:(UIStatusBarAnimation)animation NS_AVAILABLE_IOS(3_2);
//    - (void)setStatusBarHidden:(BOOL)hidden animated:(BOOL)animated NS_DEPRECATED_IOS(2_0, 3_2);
    
    //修改导航条字体颜色
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObject:[UIColor orangeColor] forKey:UITextAttributeTextColor];
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextColor,
                                                                     [UIColor colorWithRed:0 green:0.7 blue:0.8 alpha:1], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:0.0], UITextAttributeFont,
                                                                     nil]];
//    通过以下key值修改起属性
//    UITextAttributeFont
//    UITextAttributeTextShadowOffset
//    UITextAttributeTextShadowColor

    self.title = @"UIView";
    self.view.backgroundColor = [UIColor whiteColor];
    //UIView的CALayer类似UIView的子View树形结构
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 90, 50)];
    view.backgroundColor = [UIColor orangeColor];
//    view.layer.anchorPoint = CGPointMake(0.f,0.f);
//    view.layer.position = CGPointMake(0, 0);
    //layer可以设置圆角显示（cornerRadius）
    view.layer.cornerRadius = 10;
    //设置阴影 (shadowColor)
    view.layer.shadowColor = [[UIColor redColor] CGColor];
    view.layer.backgroundColor = [[[UIColor blackColor] colorWithAlphaComponent:0.2] CGColor];
    //7.渲染：当更新层，改变不能立即显示在屏幕上。当所有的层都准备好时，可以调用setNeedsDisplay方法来重绘显示。
//    [view.layer setNeedsDisplay];
//    //若要重绘部分屏幕区域，请使用setNeedsDisplayInRect:方法，通过在CGRect结构的区域更新：
//    [view.layer setNeedsDisplayInRect:CGRectMake(150.0,100.0,50.0,75.0)];
//    //如果是用的Core Graphics框架来执行渲染的话，可以直接渲染Core Graphics的内容。用renderInContext:来做这个事。
//    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
//    //8.变换：要在一个层中添加一个3D或仿射变换，可以分别设置层的transform或affineTransform属性。
//    view.layer.transform = CATransform3DMakeScale(-1.0,-1.0,1.0);
//    CGAffineTransform transform = CGAffineTransformMakeRotation(45.0);
//    view.layer.affineTransform = transform;
//    [self.view addSubview:view];
    
    UIView *image = [[UIView alloc] initWithFrame:CGRectMake(0, 40,  [UIScreen mainScreen].applicationFrame.size.width, [UIScreen mainScreen].applicationFrame.size.height/2)];
    [image setBackgroundColor:[UIColor orangeColor]];
    UIColor *bgColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1.jpg"]];
    image.tag = 1000;
    [image setBackgroundColor:bgColor];
    [self.view addSubview:image];
    [self.view sendSubviewToBack:image];
    [image addSubview:view];
    view.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(80, 200, 80, 40);
    [btn setBackgroundColor:[UIColor orangeColor]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    for (NSString *name in [UIFont familyNames]) {
        NSLog(@"family name = %@", name);
    }
    
	// Do any additional setup after loading the view.
}


- (void)btnClick:(id)send
{
    UIView *view = [self.view viewWithTag:1000];
    view.frame = CGRectMake(0, 40, 200, [UIScreen mainScreen].applicationFrame.size.height/3);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
