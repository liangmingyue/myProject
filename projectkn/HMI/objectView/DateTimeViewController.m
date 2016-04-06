//
//  DateTimeViewController.m
//  projectkn
//
//  Created by xie minna on 14-12-23.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "DateTimeViewController.h"

@implementation DateTimeViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *locationString=[formatter stringFromDate: [NSDate date]];
    
    //获取当前时间作为productId
    [formatter setDateFormat:@"hhmmss"];
    locationString=[formatter stringFromDate:[NSDate date]];
//    downloadInfo.productId = locationString;
    
}

/******************************************************************************
 函数名称  : getDate
 函数描述  : 获取当前日期时间
 输入参数  : N/A
 输出参数  : N/A
 返回值    : NSString 当前时间
 备注     :
 ******************************************************************************/
-(NSString *)getDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd EEEE HH:mm:ss a"];
    NSString *locationString=[formatter stringFromDate: [NSDate date]];
    return locationString;
}


//大写的H日期格式将默认为24小时制，小写的h日期格式将默认为12小时
//不需要特别设置，只需要在dataFormat里设置类似"yyyy-MMM-dd"这样的格式就可以了
//日期格式如下:
//y  年  Year  1996; 96
//M  年中的月份  Month  July; Jul; 07
//w  年中的周数  Number  27
//W  月份中的周数  Number  2
//D  年中的天数  Number  189
//d  月份中的天数  Number  10
//F  月份中的星期  Number  2
//E  星期中的天数  Text  Tuesday; Tue
//a  Am/pm 标记  Text  PM
//H  一天中的小时数（0-23）  Number  0
//k  一天中的小时数（1-24）  Number  24
//K  am/pm 中的小时数（0-11）  Number  0
//h  am/pm 中的小时数（1-12）  Number  12
//m  小时中的分钟数  Number  30
//s  分钟中的秒数  Number  55
//S  毫秒数  Number  978
//z  时区  General time zone  Pacific Standard Time; PST; GMT-08:00
//Z  时区  RFC 822 time zone  -0800

@end
