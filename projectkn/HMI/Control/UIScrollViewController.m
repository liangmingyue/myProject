//
//  UIScrollViewController.m
//  projectkn
//
//  Created by xie minna on 14-9-12.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UIScrollViewController.h"

@interface UIScrollViewController ()<UIScrollViewDelegate>

@end

@implementation UIScrollViewController

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
    CGRect bounds = [ [ UIScreen mainScreen ] applicationFrame ] ;
    UIScrollView* scrollView = [[UIScrollView alloc ] initWithFrame:bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    //scrollview可以滚动的区域
    scrollView.contentSize = self.view.frame.size;
    //开启缩放功能需要调整视图的两个属性，分别是maxinumZoomScale 和 mininumZoomScale
    scrollView.maximumZoomScale = 2.0;//允许放大2倍
    scrollView.minimumZoomScale = 0.5;//允许放大到0.5倍
    scrollView.delegate = self;
    //指定你希望使用的滚动条指示器的类型。默认行为是在白边界上绘制黑色的滚动条
//    UIScrollViewIndicatorStyleDefault
//    UIScrollViewIndicatorStyleBlack
//    UIScrollViewIndicatorStyleWhite
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    //默认行为是允许用户同时进行横向和纵向的滚动。将这个属性设置为YES会导致将用户的滚动行为锁定成只允许横向或纵向进行
    scrollView.directionalLockEnabled = YES;
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 150, 20)];
    lb.text = @"xxxxxxx";
    [scrollView addSubview:lb];
    //当前显示区域顶点相对于frame顶点的偏移量
    scrollView.contentOffset = CGPointMake(0, 480);
    //滚动时,是否显示水平滚动条
    scrollView.showsHorizontalScrollIndicator = YES;
    //滚动时,是否显示垂直滚动条
    scrollView.showsVerticalScrollIndicator = YES;
    //默认是yes,就是滚动超过边界,会反弹有反弹回来的效果,假如是 NO,那么滚动到达边界,那么会连忙停止
    scrollView.bounces = YES;
    //设置滚动条的位置
    scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(10, 10, 10,100);
    //控制控件是否整页翻动
    scrollView.pagingEnabled = YES;
    //控制控件是否能滚动
    scrollView.scrollEnabled = YES;
    //改变scrollerView的减速点位置
    scrollView.decelerationRate = 10;
    //监控当前目标是否正在被跟踪
    if (scrollView.tracking == YES) {
        NSLog(@"是否当前目标是否正在跟踪");
    }
    //监控当前目标是否正在被拖拽
    if (scrollView.dragging == YES) {
        NSLog(@"监控当前目标是否正在被拖拽");
    }
    //监控当前目标是否正在减速
    if (scrollView.decelerating) {
        NSLog(@"decelerating");
    }
    //控制视图是否延时调用开始滚动的方法
    scrollView.delaysContentTouches = YES;
    
    //控制控件是否接触取消touch的事件
    scrollView.canCancelContentTouches = YES;
    
    //判断控件的大小是否正在改变
    if (scrollView.zooming == YES) {
        NSLog(@"判断控件的大小是否正在改变");
    }
    //判断是否正在进行缩放反弹
    if (scrollView.zoomBouncing) {
        NSLog(@"判断是否正在进行缩放反弹");
    }
    
    scrollView.scrollsToTop = YES;

    //一个CGPoint结构，其中包含有要显示内容相对于窗口左上角的偏移量。默认是从0×0开始的，但是你也可以将显示内容放在其他位置。
    [self.view addSubview:scrollView];
	// Do any additional setup after loading the view.
}

-(void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    //会在视图滚动时收到通知。包括一个指向被滚动视图的指针，从中可以读取contentOffset属性以确定其滚动到的位置。
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //当用户首次在某个方向上进行拖动时得到通知。这个方法会得到被作为参数传递的滚动视图指针，也同样可以从中读取 contentOffset 属性。
}

-(void)scrollViewDidEndDragging:(UIScrollView*)scrollView willDecelerate:(BOOL)decelerate
{
    //当用户抬起拖动到手指时得到通知。还会得到一个布尔值，知名报告滚动视图最后位置之前，是否需要减速。
}

-(void)scrollViewWillBeginDecelerate:(UIScrollView*)scrollView
{
    //当用户抬起手指而视图需要继续移动时，会收到通知。这个方法可以用来读取 contentOffset属性，从而判断出当用户抬起手指钱最后一次滚动到的位置，虽然这个位置并不会使滚动条的最终停止位置。
}

-(void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    //当上面提到的减速完毕、滚动视图停止时得到通知。收到这个通知的时刻，滚动视图的contentOffset属性会反映出滚动条最终停止的位置。
}

-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    //当用户对内容进行缩放时，会收到通知。缩放比例表示为一个浮点值，会作为参数传递进来。

}

-(BOOL)scrollViewShouldScrollToTop:(UIScrollView*)scrollView
{
    return YES;
}

-(void)scrollViewDidScrollToTop:(UIScrollView*)scrollView
{
    //当用户点出iPhone状态条时，滚动视图委托可以决定视图是否滚动回到开头。
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
