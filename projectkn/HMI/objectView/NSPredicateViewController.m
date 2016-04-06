//
//  NSPredicateViewController.m
//  projectkn
//
//  Created by minna.xie on 15/10/26.
//  Copyright (c) 2015年 xie minna. All rights reserved.
//

#import "NSPredicateViewController.h"

@implementation NSPredicateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    //正则表达式基本语法  http://www.cnblogs.com/light169/archive/2006/10/18/532347.html
    //https://msdn.microsoft.com/zh-cn/library/ae5bf541%28VS.80%29.aspx
    //1、两个特殊的符号'^'和'$'。他们的作用是分别指出一个字符串的开始和结束
    //2、'*'，'+'和'?'这三个符号，表示一个或一序列字符重复出现的次数
    //3、使用范围，用大括号括起，用以表示重复次数的范围
    //4、'¦'，表示“或”操作
    //5、'.'可以替代任何字符
    //6、方括号表示某些字符允许在一个字符串中的某一特定位置出现
    //7、为了逐字表达，你必须在"^.$()¦*+?{\"这些字符前加上转移字符'\'。
    //8、请注意在方括号中，不需要转义字符。
    
    //-------NSPredicate  http://blog.csdn.net/ztp800201/article/details/8116081
    //简述：Cocoa框架中的NSPredicate用于查询，原理和用法都类似于SQL中的where，作用相当于数据库的过滤取。
    //定义(最常用到的方法)：
    //    Format：
    //    (1)比较运算符>,<,==,>=,<=,!=
    //    可用于数值及字符串
    //    例：@"number > 100"
    //    (2)范围运算符：IN、BETWEEN
    //    例：@"number BETWEEN {1,5}"
    //    @"address IN {'shanghai','beijing'}"
    //    (3)字符串本身:SELF
    //    例：@“SELF == ‘APPLE’"
    //    (4)字符串相关：BEGINSWITH、ENDSWITH、CONTAINS
    //    例：@"name CONTAIN[cd] 'ang'"   //包含某个字符串
    //    @"name BEGINSWITH[c] 'sh'"     //以某个字符串开头
    //    @"name ENDSWITH[d] 'ang'"      //以某个字符串结束
    //    注:[c]不区分大小写[d]不区分发音符号即没有重音符号[cd]既不区分大小写，也不区分发音符号。
    //    (5)通配符：LIKE
    //    例：@"name LIKE[cd] '*er*'"    //*代表通配符,Like也接受[cd].
    //    @"name LIKE[cd] '???er*'"
    //    (6)正则表达式：MATCHES
    //    例：NSString *regex = @"^A.+e$";   //以A开头，e结尾
    //    @"name MATCHES %@",regex
    
    //----(1)对NSArray进行过滤
    NSArray *array = [[NSArray alloc] initWithObjects:@"beijing", @"shanghai", @"wuhan", nil];
    NSString *sting  = @"ang";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF CONTAINS %@", sting];
    NSLog(@"%@", [array filteredArrayUsingPredicate:pred]);
    
    //(2)判断字符串首字母是否为字母:
    NSString *rege = @"[A-Za-z]+";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rege];
    if ([predicate evaluateWithObject:sting]) {
        NSLog(@"SELE MATCHES");
    }
    
    //(3)字符串替换：
    NSError* error = NULL;
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"(encoding=\")[^\"]+(\")"
                                                                           options:0
                                                                             error:&error];
    NSString* sample = @"<xml encoding=\"abc\"></xml><xml encoding=\"def\"></xml><xml encoding=\"ttt\"></xml>";
    NSLog(@"Start:%@",sample);
    NSString* result = [regex stringByReplacingMatchesInString:sample
                                                       options:0
                                                         range:NSMakeRange(0, sample.length)
                                                  withTemplate:@"$1utf-8$2"];
    NSLog(@"Result:%@", result);
    
    //(5)判断手机号码，电话号码函数
    
}

@end
