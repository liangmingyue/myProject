//
//  GestureViewController.m
//  projectkn
//
//  Created by xie minna on 14-8-20.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "GestureViewController.h"

@interface GestureViewController ()<UIGestureRecognizerDelegate>
{
    UIImageView *imageView;
}

@end

@implementation GestureViewController
    CGFloat lastScaleFactor=1;//放大、缩小
    CGFloat  netRotation;//旋转
    CGPoint netTranslation;//平衡
    NSArray *images;//图片数组
    int imageIndex=0;//数组下标

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
    self.title = @"手势";
    self.view.backgroundColor = [UIColor whiteColor];
    
//    1、拍击UITapGestureRecognizer (任意次数的拍击)
//    2、向里或向外捏UIPinchGestureRecognizer (用于缩放)
//    3、摇动或者拖拽UIPanGestureRecognizer
//    4、滑动UISwipeGestureRecognizer (以任意方向)
//    5、旋转UIRotationGestureRecognizer (手指朝相反方向移动)
//    6、长按UILongPressGestureRecognizer
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 250, 150)];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:@"section0_emotion4.png"];
    [self.view addSubview:imageView];
    
    //1、创建手势实例，并连接方法handleTapGesture,点击手势
    UITapGestureRecognizer *tapGesture=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    //设置手势点击数,双击：点2下
    tapGesture.numberOfTouchesRequired = 1;     //手指数
    tapGesture.numberOfTapsRequired = 1;        //tap次数
    tapGesture.delegate = self;
    // imageView添加手势识别
    [self.view addGestureRecognizer:tapGesture];
    
    //2、手势为捏的姿势:按住option按钮配合鼠标来做这个动作在虚拟器上
    UIPinchGestureRecognizer *pinchGesture=[[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(handlePinchGesture:)];
    [imageView addGestureRecognizer:pinchGesture];//imageView添加手势识别
    
    //3、旋转手势:按住option按钮配合鼠标来做这个动作在虚拟器上
    UIRotationGestureRecognizer *rotateGesture=[[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(handleRotateGesture:)];
    [imageView addGestureRecognizer:rotateGesture];
    
    // 向上滑动
    // 滑动手指的个数  numberOfTouchesRequired
    // 手指滑动的方向 （Up,Down,Left,Right） direction
    UISwipeGestureRecognizer *oneFingerSwipeUp =
    [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(oneFingerSwipeUp:)];
    [oneFingerSwipeUp setDirection:UISwipeGestureRecognizerDirectionUp];
    [[self view] addGestureRecognizer:oneFingerSwipeUp];
    
    //旋转手势
    // 旋转方向，小于0为逆时针旋转手势，大于0为顺时针手势 rotation
    // 旋转速率  velocity
    UIRotationGestureRecognizer *twoFingersRotate =  [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingersRotate:)];
    [[self view] addGestureRecognizer:twoFingersRotate];
    
    //4、拖手势
    UIPanGestureRecognizer *panGesture=[[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    [imageView addGestureRecognizer:panGesture];
    
    //5、划动手势
    images=[[NSArray alloc]initWithObjects:@"cell.jpg",@"heihua.jpg",@"xuanyi.jpg", nil];
    //右划
    UISwipeGestureRecognizer *swipeGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeGesture:)];
    [imageView addGestureRecognizer:swipeGesture];
    
    //左划
    UISwipeGestureRecognizer *swipeLeftGesture=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipeGesture:)];
    swipeGesture.direction=UISwipeGestureRecognizerDirectionLeft;//不设置黑夜是右
    [imageView addGestureRecognizer:swipeLeftGesture];
    
    //6、长按手势
    UILongPressGestureRecognizer *longpressGesutre=[[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(handleLongpressGesture:)];
    //长按时间为1秒
    longpressGesutre.minimumPressDuration=1;
    //允许15秒中运动
    longpressGesutre.allowableMovement=15;
    //所需触摸1次
    longpressGesutre.numberOfTouchesRequired=1;
    [imageView addGestureRecognizer:longpressGesutre];
    
}

//双击屏幕时会调用此方法,放大和缩小图片
-(void)handleTapGesture:(UIGestureRecognizer*)sender
{
    NSLog(@"xxx");
    //判断imageView的内容模式是否是UIViewContentModeScaleAspectFit,该模式是原比例，按照图片原时比例显示大小
    if(sender.view.contentMode==UIViewContentModeScaleAspectFit) {
        //把imageView模式改成UIViewContentModeCenter，按照图片原先的大小显示中心的一部分在imageView
        sender.view.contentMode=UIViewContentModeCenter;
    }else{
        sender.view.contentMode=UIViewContentModeScaleAspectFit;
    }
 }

    //捏的手势，使图片放大和缩小，捏的动作是一个连续的动作
 -(IBAction)handlePinchGesture:(UIGestureRecognizer*)sender{
    //得到sender捏手势的大小
    CGFloat factor=[(UIPinchGestureRecognizer*)sender scale];
    if(factor>1){
        //图片放大
        sender.view.transform=CGAffineTransformMakeScale(lastScaleFactor+(factor-1), (lastScaleFactor+(factor-1)));
    }else{
        //缩小
        sender.view.transform=CGAffineTransformMakeScale(lastScaleFactor*factor, lastScaleFactor*factor);
    }
    //状态是否结束，如果结束保存数据
    if(sender.state==UIGestureRecognizerStateEnded){
        if(factor>1){
            lastScaleFactor+=(factor-1);
        }else{
            lastScaleFactor*=factor;
        }
    }
 }

- (void)oneFingerSwipeUp:(UISwipeGestureRecognizer *)recognizer
{
    CGPoint point = [recognizer locationInView:[self view]];
    NSLog(@"Swipe up - start location: %f,%f", point.x, point.y);
}

- (void)twoFingersRotate:(UIRotationGestureRecognizer *)recognizer
{
    // Convert the radian value to show the degree of rotation
    NSLog(@"Rotation in degrees since last change: %f", [recognizer rotation] * (180 / M_PI));
}

//旋转手势
-(IBAction)handleRotateGesture:(UIGestureRecognizer*)sender
{
    //浮点类型，得到sender的旋转度数
    CGFloat rotation=[(UIRotationGestureRecognizer*)sender rotation];
    //旋转角度CGAffineTransformMakeRotation
    CGAffineTransform transform=CGAffineTransformMakeRotation(rotation+netRotation);
    //改变图像角度
    sender.view.transform=transform;
    //状态结束，保存数据
    if(sender.state==UIGestureRecognizerStateEnded){
        netRotation+=rotation;
    }
}

//拖手势
-(IBAction)handlePanGesture:(UIGestureRecognizer*)sender{
    //得到拖的过程中的xy坐标该方法返回在横坐标上、纵坐标上拖动了多少像素
    CGPoint translation=[(UIPanGestureRecognizer*)sender translationInView:imageView];
    //  - (CGPoint)velocityInView:(UIView *)view
    // 你拖动这个图片的时候肯定有个速度，因此返回值就是你拖动时X和Y轴上的速度，速度是矢量，有方向。
    //平移图片CGAffineTransformMakeTranslation
    sender.view.transform=CGAffineTransformMakeTranslation(netTranslation.x+translation.x, netTranslation.y+translation.y);
    //状态结束，保存数据
    if(sender.state==UIGestureRecognizerStateEnded){
        netTranslation.x+=translation.x;
        netTranslation.y+=translation.y;
    }
}

//划动手势
-(IBAction)handleSwipeGesture:(UIGestureRecognizer*)sender{
    //划动的方向
    UISwipeGestureRecognizerDirection direction=[(UISwipeGestureRecognizer*) sender direction];
    //判断是上下左右
    switch (direction) {
    case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"up");
            break;
    case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"down");
            break;
    case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"left");
            imageIndex++;//下标++
            break;
    case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"right");
            imageIndex--;//下标--
            break;
    default:
            break;
    }
    //得到不越界不<0的下标
    imageIndex=(imageIndex<0)?([images count]-1):imageIndex%[images count];
    //imageView显示图片
    imageView.image=[UIImage imageNamed:[images objectAtIndex:imageIndex]];
}
//长按手势
 -(IBAction)handleLongpressGesture:(UIGestureRecognizer*)sender{
    //创建警告
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:@"Image options" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Save Image",@"Copy", nil];
    //当前view显示警告
    [actionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
