//
//  UIImagetViewViewController.m
//  projectkn
//
//  Created by xie minna on 14-8-20.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UIImagetViewViewController.h"

@interface UIImagetViewViewController ()

@end

@implementation UIImagetViewViewController

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
#if 0
    
#endif
    
    [super viewDidLoad];
    self.title = @"图片显示";
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *path = [[NSBundle mainBundle] resourcePath];
    NSString *imagePath = [NSString stringWithFormat:@"%@/1.jpg", path];
    UIImage *imageValue = [[UIImage alloc] initWithContentsOfFile:imagePath];
    UIImageView *imageView1 = [[UIImageView alloc] initWithImage:imageValue];
    imageView1.frame = CGRectMake(0, 0, 80, 80);
    [self.view addSubview:imageView1];
    
    //从网络得到图片
    UIImageView  *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 120, 120)];
    imageView.highlightedImage = [UIImage imageNamed:@"section0_emotion1"];
    [imageView setImage:[[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://up.2cto.com/2013/0702/20130702085459778.jpg"]]]];
    //允许用户操作该 区域
    imageView.userInteractionEnabled=YES;
    UITapGestureRecognizer *singleTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickImage)];
    //把手势对象，添加给视图对象
    [imageView addGestureRecognizer:singleTap];
    //contentMode属性：UIViewContentModeScaleToFill属性会导致图片变形。UIViewContentModeScaleAspectFit会保证图片比例不变
//    typedef enum {
//        UIViewContentModeScaleToFill,  -拉伸充满载体
//        UIViewContentModeScaleAspectFit,      // 内容符合固定方面。剩余部分是透明的 --拉伸不改变比例，充满小的一边
//        UIViewContentModeScaleAspectFill,     // 内容扩展与固定方面填补。可能是剪的一部分内容。--- 拉伸不改变比例，充满最大的一边
//        UIViewContentModeRedraw,              // 重划边界变化(调用-setNeedsDisplay)
//        UIViewContentModeCenter,              // contents remain same size. positioned adjusted.
//        UIViewContentModeTop,
//        UIViewContentModeBottom,
//        UIViewContentModeLeft,
//        UIViewContentModeRight,
//        UIViewContentModeTopLeft,
//        UIViewContentModeTopRight,
//        UIViewContentModeBottomLeft,
//        UIViewContentModeBottomRight,
//    } UIViewContentMode;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView.center = CGPointMake(100, 100);
    //使用transform属性:其中dx与dy表示想要往x或者y方向移动多少，而不是移动到多少。
    imageView.transform = CGAffineTransformMakeTranslation(100, 100);
    //5、旋转图像
    imageView.transform = CGAffineTransformMakeRotation(30);
    //6、缩放图像，CGFloat scale_w与CGFloat scale_h分别表示将原来的宽度和高度缩放到多少倍，下图是缩放到原来的0.6倍的示意图：
    imageView.transform = CGAffineTransformMakeScale(2, 5);
    [imageView sizeToFit];    // 将图片尺寸调整为与内容图片相同
    imageView.highlightedImage = (UIImage *)[UIImage imageNamed:@"section0_emotion1.png"];  // 设置高亮时显示的图片
    [self.view addSubview:imageView];
    
    UIImageView *newImage = [[UIImageView alloc] initWithFrame:CGRectMake(100, 330, 120, 120)];
    newImage.animationImages = [NSArray arrayWithObjects:
                                                         [UIImage imageNamed:@"section0_emotion1.png"],
                                                         [UIImage imageNamed:@"section0_emotion2.png"],
                                                         [UIImage imageNamed:@"section0_emotion3.png"],
                                                         [UIImage imageNamed:@"section0_emotion4.png"],
                                                         [UIImage imageNamed:@"section0_emotion5.png"],nil];
    newImage.animationDuration = 5.0;   // 设定所有的图片在多少秒内播放完毕
    imageView.animationRepeatCount = 0; // 不重复播放多少遍，0表示无数遍
    [newImage startAnimating];
    newImage.image = [UIImage imageNamed:@"a.png"];
    [newImage setIsAccessibilityElement:YES];
    [newImage setAccessibilityLabel:self.title];
    [self.view addSubview:newImage];
	// Do any additional setup after loading the view.
}

-(void)onClickImage
{
    //here, do whatever you wantto do
    NSLog(@"imageview is clicked!");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
