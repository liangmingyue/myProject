//
//  UITextFeildViewController.m
//  projectkn
//
//  Created by xie minna on 14-9-23.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UITextFeildViewController.h"
#import "AL_CustomTextField.h"

@interface UITextFeildViewController () <UITextFieldDelegate>
{
    AL_CustomTextField *text;
}

@end

@implementation UITextFeildViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

   UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(120.0f, 80.0f, 150.0f, 30.0f)];
    [self.view addSubview:textField];
    [textField setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    textField.placeholder = @"password"; //默认显示的字
//    textField.secureTextEntry = YES; //密码
    textField.autocorrectionType = UITextAutocorrectionTypeNo;//设置是否启动自动提醒更正功能
    textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    textField.returnKeyType = UIReturnKeyDone;//键盘返回类型
    textField.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    textField.keyboardType = UIKeyboardTypeDefault;//键盘显示类型
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter; //设置居中输入
    textField.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    textField.enablesReturnKeyAutomatically = YES; //这里设置为无文字就灰色不可点
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //是否纠错
//    textField.autocorrectionType = UITextAutocorrectionTypeNo;
//    typedef enum {
//        UITextAutocorrectionTypeDefault, 默认
//        UITextAutocorrectionTypeNo, 　不自动纠错
//        UITextAutocorrectionTypeYes,　自动纠错
//    } UITextAutocorrectionType;
    
    //再次编辑就清空
    textField.clearsOnBeginEditing = YES;
    
    //最右侧加图片是以下代码,
    /*
    UIImageView *imgv=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"section0_emotion1.png"]];
    textField.rightView=imgv;
    textField.rightViewMode = UITextFieldViewModeAlways;
    
    textField.leftView=imgv;
    textField.leftViewMode = UITextFieldViewModeAlways;
    //UITextField 继承自 UIControl,此类中有一个属性contentVerticalAlignment
    //所以想让UITextField里面的text垂直居中可以这样写:
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
     */
    
    //首字母是否大写
    textField.autocapitalizationType = UITextAutocapitalizationTypeWords;
//    typedef enum {
//        UITextAutocapitalizationTypeNone, 不自动大写
//        UITextAutocapitalizationTypeWords,　单词首字母大写
//        UITextAutocapitalizationTypeSentences,　句子的首字母大写
//        UITextAutocapitalizationTypeAllCharacters, 所有字母都大写
//    } UITextAutocapitalizationType;
    textField.delegate = self;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    UIImage *seachImageNormal = [UIImage imageNamed:@"FMLink_AQI_INPUT_BG.png"];
    UIImage *stretchableSeachImageNormal = [seachImageNormal stretchableImageWithLeftCapWidth:seachImageNormal.size.width/2.0
                                                                     topCapHeight:seachImageNormal.size.height/2.0];
   NSString *placeholder = @"歌曲、专辑、艺人、精选集";
   text = [[AL_CustomTextField alloc] initWithFrame:CGRectMake(5, 150.0f,
                                                                     300,
                                                                     40.0f) withPlaceholder:placeholder withBackImage:seachImageNormal];
    text.delegate = self;
//    text.delegate = self;
    [self.view addSubview:text];
    [self hiddenSearchAnimation];
    [self notificationCenterAction];
    
//    UISearchBar* m_searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 200, 320, 41)];
//    m_searchBar.delegate = self;
//    m_searchBar.barStyle = UIBarStyleBlackTranslucent;
//    m_searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
//    m_searchBar.autocapitalizationType = UITextAutocapitalizationTypeNone;
//    [m_searchBar setTranslucent:YES];
////    [m_searchBar setBackgroundImage:stretchableSeachImageNormal];
////    [m_searchBar setSearchFieldBackgroundImage:stretchableSeachImageNormal forState:UIControlStateNormal];
//    m_searchBar.placeholder = @"歌曲、专辑、艺人、精选集";
//    [m_searchBar setShowsCancelButton:YES];
//    m_searchBar.keyboardType =  UIKeyboardTypeDefault;
//    for (id subView in [m_searchBar subviews]) {
//        if ([subView isKindOfClass:[UIButton class]]) {
//            UIButton *btn = (UIButton *)subView;
//            [btn setTitle:@"搜索" forState:UIControlStateNormal];
//        }
//    }
//    [self.view addSubview:m_searchBar];
    
    UISearchBar *mySearchBar = [self createSearchBarWithPlaceholder:@"歌曲、专辑、艺人、精选集" tag:0];
    mySearchBar.barStyle = UIBarStyleBlackTranslucent;
    mySearchBar.keyboardType =  UIKeyboardTypeDefault;
    mySearchBar.frame = CGRectMake(0, 200, 320, 41);
    mySearchBar.backgroundColor = [UIColor clearColor];
    mySearchBar.searchBarStyle =  UISearchBarStyleMinimal;
    [mySearchBar setBackgroundImage:stretchableSeachImageNormal];
//    [mySearchBar setSearchFieldBackgroundImage:stretchableSeachImageNormal forState:UIControlStateNormal];
//   [mySearchBar setBackgroundImage:[self imageWithColor:[UIColor clearColor]]];
    mySearchBar.delegate = self;
    mySearchBar.translucent = YES;//指定控件是否会有透视效果
    mySearchBar.showsCancelButton = NO;
    [mySearchBar setTranslucent:YES];
    [mySearchBar isFirstResponder];
    for(id searchbuttons in [mySearchBar subviews])
    {
        if ([searchbuttons isKindOfClass:[UIButton class]])
        {
            UIButton *cancelButton = (UIButton*)searchbuttons;
            cancelButton.enabled = YES;
            [cancelButton setTitle:@"搜索" forState:UIControlStateNormal];//文字
//            break;
        }
        
        if ([searchbuttons isKindOfClass:NSClassFromString(@"UISearchBarBackground")])
        {
            [searchbuttons removeFromSuperview];
            break;  
        }
    }
    [self.view addSubview:mySearchBar];
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    searchBar.showsCancelButton = NO;
    for(id searchbuttons in [searchBar subviews])
    {
        if ([searchbuttons isKindOfClass:[UIButton class]])
        {
            UIButton *cancelButton = (UIButton*)searchbuttons;
            cancelButton.enabled = YES;
            [cancelButton setTitle:@"搜索"  forState:UIControlStateNormal];//文字
            break;
        }
    }
    return YES;
}

-(UIImage*) imageWithColor:(UIColor*)color
{
    return [self imageWithColor:color Size:CGSizeMake(1.0f, 1.0f)];
}
//根据颜色返回图片
-(UIImage*) imageWithColor:(UIColor*)color Size:(CGSize)imgSize
{
    CGRect rect = CGRectMake(0.0f, 0.0f, imgSize.width, imgSize.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UISearchBar *)createSearchBarWithPlaceholder:(NSString *)placeholder tag:(NSInteger)tag
{
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.autocorrectionType = UITextAutocorrectionTypeNo;
    searchBar.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
    searchBar.showsCancelButton = NO;
    searchBar.barStyle = UIBarStyleBlack;
    searchBar.placeholder = placeholder;
    searchBar.tag = tag;
    return searchBar;
}

-(void) notificationCenterAction
{
    //监听键盘的事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:self.view.window];
}


//键盘升起时动画
- (void)keyboardWillShow:(NSNotification*)notif
{
    //动态提起整个屏幕
//    [UIView animateWithDuration:4 animations:^{
    
        [self searchAnimation];
        
//    } completion:nil];
}

//键盘关闭时动画
- (void)keyboardWillHide:(NSNotification*)notif
{
    
//    [UIView animateWithDuration:4 animations:^{
    
        [self hiddenSearchAnimation];
        
//    } completion:nil];
}

//显示隐藏状态
-(void) hiddenSearchAnimation
{
    if (!self.inputView) {
        self.inputView = [[UIView alloc] init];
        text.leftView = self.inputView;
    }
    
    if (!self.imgSearch) {
        self.imgSearch = [[UIImageView alloc] init];
        self.imgSearch.image = [UIImage imageNamed:@"FMLink_AQI_ICN_Search"];
        [self.inputView addSubview:self.imgSearch];
    }
    
    float imgSearchSide = self.imgSearch.image.size.height;
    CGFloat textFieldW = (text.frame.size.width) / 2 - 90;
    self.inputView.frame= CGRectMake(0, 0 ,textFieldW , imgSearchSide);
    CGRect rx = CGRectMake(textFieldW - imgSearchSide , 0, imgSearchSide, imgSearchSide);
    self.imgSearch.frame = rx;
    // 把leftVw设置给文本框
}

-(void) searchAnimation
{
    float imgSearchSide = self.imgSearch.image.size.height;
    self.inputView.frame= CGRectMake(0, 0 ,imgSearchSide , imgSearchSide);
    CGRect rx = CGRectMake(0, 0, imgSearchSide, imgSearchSide);
    self.imgSearch.frame = rx;
//    text.leftView = self.inputView;
}



//限制输入文本的长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 10)
        return NO; // return NO to not change text
    return YES;
}

//要实现的Delegate方法,关闭键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"clear");
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
