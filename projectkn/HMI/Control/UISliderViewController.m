//
//  UISliderViewController.m
//  testlabel
//
//  Created by 王颜龙 on 14-6-23.
//  Copyright (c) 2014年 longyan. All rights reserved.
//

#import "UISliderViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface UISliderViewController ()
@property (nonatomic,strong)UISlider *volumeSlider;
@property (nonatomic,strong)UISlider *slider;
@property (nonatomic,assign)CGPoint firstPoint;
@property (nonatomic,assign)CGPoint secondPoint;
@end

@implementation UISliderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    MPVolumeView *volumeView = [[MPVolumeView alloc] init];
    [self.view addSubview:volumeView];
    [volumeView sizeToFit];
    NSLog(@"%@",volumeView.subviews);
    volumeView.hidden = YES;
    volumeView.frame = CGRectMake(-1000, -100, 100, 100);
    
    
    
    
    
    self.slider = [[UISlider alloc]init];
    self.slider.backgroundColor = [UIColor blueColor];
    for (UIControl *view in volumeView.subviews) {
        if ([view.superclass isSubclassOfClass:[UISlider class]]) {
            NSLog(@"1");
            self.slider = (UISlider *)view;
        }
    }
    self.slider.autoresizesSubviews = NO;
    self.slider.autoresizingMask = UIViewAutoresizingNone;
    [self.view addSubview:self.slider];
    self.slider.hidden = YES;
    NSLog(@"%f",self.slider.value);
    self.slider.frame = CGRectMake(-1000, -100, 100, 100);
    
    NSLog(@"%@",volumeView.subviews);
    // 测试
    //添加
    
    NSError *error;
    // Active audio session before you listen to the volume change event.
    // It must be called first.
    // The old style code equivalent to the line below is:
    //
    // AudioSessionInitialize(NULL, NULL, NULL, NULL);
    // AudioSessionSetActive(YES);
    //
    // Now the code above is deprecated in iOS 7.0, you should use the new
    // code here.
    [[AVAudioSession sharedInstance] setActive:YES error:&error];
    
    // add event handler, for this example, it is `volumeChange:` method
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChanged:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];

//    UISlider *slider =
    
//    self.volumeSlider = [[UISlider alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
//    self.volumeSlider.backgroundColor = [UIColor yellowColor];
//    self.volumeSlider.minimumValue = 0.0;
//    self.volumeSlider.maximumValue = 1.0;
//    self.volumeSlider.continuous = YES;
//    [self.volumeSlider addTarget:self action:@selector(volumeChange) forControlEvents:UIControlEventValueChanged];
//    [self.view addSubview:self.volumeSlider];
    UISlider *slider1 = [[UISlider alloc] initWithFrame:CGRectMake(0, 100, 200, 20)];
    slider1.tag = 1000;
    slider1.minimumValue = self.slider.minimumValue;
    slider1.maximumValue = self.slider.maximumValue;
    slider1.value = self.slider.value;
    [slider1 addTarget:self action:@selector(updateValue:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];

}

- (void)updateValue:(UISlider *)slider{
    self.slider.value = slider.value;
}

- (void)volumeChanged:(NSNotification *)notification
{
    // service logic here.
    NSLog(@"DXXXX");
}

- (void)volumeChange
{
    [[MPMusicPlayerController applicationMusicPlayer] setVolume:self.volumeSlider.value];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches) {
        
        self.firstPoint = [touch locationInView:self.view];

    }
    
    UISlider *slider = (UISlider *)[self.view viewWithTag:1000];
    slider.value = self.slider.value;
    NSLog(@"touchesBegan");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for(UITouch *touch in event.allTouches) {
        
        self.secondPoint = [touch locationInView:self.view];
        
    }
    NSLog(@"firstPoint==%f || secondPoint===%f",self.firstPoint.y,self.secondPoint.y);
    NSLog(@"first-second==%f",self.firstPoint.y - self.secondPoint.y);
   
    self.slider.value += (self.firstPoint.y - self.secondPoint.y)/500.0;
    
    UISlider *slider = (UISlider *)[self.view viewWithTag:1000];
    slider.value = self.slider.value;
    NSLog(@"value == %f",self.slider.value);
    self.firstPoint = self.secondPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesEnded");
    self.firstPoint = self.secondPoint = CGPointZero;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
