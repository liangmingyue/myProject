//
//  AL_CustomTextField.m
//  ALMainMenu
//
//  Created by minna.xie on 16/3/18.
//  Copyright © 2016年 yuhang. All rights reserved.
//

#import "AL_CustomTextField.h"

@interface AL_CustomTextField()
{
    UIImageView *backImageView;
}

@property (nonatomic ,strong ) UIView *inputView; //左边输入视图
@property (nonatomic , strong) UIImageView *imgSearch; //搜索图片

@end


@implementation AL_CustomTextField

- (id)initWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withBackImage:(UIImage *)imge
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.placeholder = placeholder;
        self.autocorrectionType = UITextAutocorrectionTypeNo;
        self.textColor = [UIColor blackColor];
        self.autocapitalizationType = UITextAutocapitalizationTypeNone;
        self.returnKeyType = UIReturnKeyDone;
        self.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
        self.keyboardType = UIKeyboardTypeDefault;
        [self setBorderStyle:UITextBorderStyleNone]; //外框类型

        UIImage *stretchableSeachImageNormal = [imge stretchableImageWithLeftCapWidth:imge.size.width/2.0
                                                                         topCapHeight:imge.size.height/2.0];
        backImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        backImageView.backgroundColor = [UIColor clearColor];
        [backImageView setImage:stretchableSeachImageNormal];
        [self addSubview:backImageView];
        
        [self hiddenSearchAnimation];
//
//        [self notificationCenterAction];
    }

    return self;
}


//显示隐藏状态
-(void) hiddenSearchAnimation
{
    if (!self.inputView) {
        self.inputView = [[UIView alloc] init];
    }
    
    if (!self.imgSearch) {
        self.imgSearch = [[UIImageView alloc] init];
        self.imgSearch.image = [UIImage imageNamed:@"FMLink_AQI_ICN_Search"];
    }
    
    float imgSearchSide = self.imgSearch.image.size.height;
    CGFloat textFieldW = (self.frame.size.width) / 2 - 90;
    self.inputView.frame= CGRectMake(0, 0 ,textFieldW , imgSearchSide);
    CGRect rx = CGRectMake(textFieldW - imgSearchSide , 0, imgSearchSide, imgSearchSide);
    self.imgSearch.frame = rx;
    [self.inputView addSubview:self.imgSearch];
    // 把leftVw设置给文本框
    self.leftView = self.inputView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

-(void) searchAnimation
{
    
    float imgSearchSide = self.imgSearch.image.size.height;
    self.inputView.frame= CGRectMake(0, 0 ,imgSearchSide , imgSearchSide);
    self.imgSearch.image = [UIImage imageNamed:@"FMLink_AQI_ICN_Search"];
    CGRect rx = CGRectMake( 12, 0, imgSearchSide, imgSearchSide);
    self.imgSearch.frame = rx;
    [self.inputView addSubview:self.imgSearch];
    // 把leftVw设置给文本框
    self.leftView = self.inputView;
    self.leftViewMode = UITextFieldViewModeAlways;
}


@end
