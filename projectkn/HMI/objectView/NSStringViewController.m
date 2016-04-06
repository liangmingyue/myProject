//
//  NSStringViewController.m
//  projectkn
//
//  Created by xie minna on 14-8-20.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "NSStringViewController.h"

@interface NSStringViewController ()

@end

@implementation NSStringViewController

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
    
    //1. NSString转化为UNICODE String：
    NSString*fname = @"Test";
    
    char fnameStr[10];
    memcpy(fnameStr, [fname cStringUsingEncoding:NSUnicodeStringEncoding], 2*([fname length]));
    
    //2. NSString转化为char
    //3. char -> NSData:
    char * postData = "TEST";
    NSData *data = [NSData dataWithBytes:postData length:strlen(postData)];
    
    
    
    //注意：在NSString 中存在自己的实例化和初始化的方法 例如：
    NSString *str1 = [NSString stringWithCString:"new String" encoding:NSASCIIStringEncoding];
    NSString *str2 = [[NSString alloc] initWithCString:"new String" encoding:NSUTF8StringEncoding];
    NSLog(@"str1 = %@ str2 = %@", str1, str2);
    //str1和str2两个对象是相同的。
    //--NSStringEncoding 中常用的字符编码----------------
    //    NSASCIIStringEncoding
    //    NSUTF8StringEncoding
    //    NSUnicodeStringEncoding
    
    //此方法自动释放内存
    // + (id)stringWithCString:(const char*)cString encoding:(NSStringEncoding)encoding;
    //进行alloc后进行初始化
    //- (id)initWithCString:(const char*)cString encoding:(NSStringEncoding)encoding;
    //例如:
    NSString *string1 = [NSString stringWithCString:"您好" encoding:NSUTF8StringEncoding];
    NSString *string2 = [[NSString alloc] initWithCString:"您好" encoding:NSUTF8StringEncoding];
    
    //--使用格式创建字符串-------------
    //+ (id)stringWithFormat:(NSString *)format...
    //- (id)initWithFormat:(NSString *)format...
    //例如：
    NSString *str = @"hello";
    NSString *string = [NSString stringWithFormat:@"%@ world", str];
    NSLog(string);
    
    //--常用的替换符--------------
    //%@ NSString实例
    //%d,%D,%i 整数
    //%u,%U 无符号整数
    //%x 将无符号整数以十六进制小写字母显示
    //%X 将无符号整数以十六进制大写字母显示
    //%f 小数
    //%c 字符
    //%s C语言字符串
    //%% 显示％字符本身
    
    //字符串连接，插入和删除
    
    
    //1、连接
    //- (NSString *)stringByAppendingString:(NSString *)string;
    //- (NSString *)stringByAppendingFormat:(NSString *)format...;
    //例如：
    NSString *str12 = @"hello";
    NSString *str22 = @"world";
    NSString *str3 = [str12 stringByAppendingString:str22];
    NSString *str4 = [str2 stringByAppendingFormat:@"%d...%d",10,20];
    NSLog(@"str3 = %@ str4 = %@", str3, str4);
    
    //NSMutableString的生成
    //NSString   + (id)string;  //生成空字符串的实例
    //+ (id)stringWithString:(NSString *)string;     //带自动释放内存
    //- (id)initWithString:(NSString *)string;
    //例如:
    NSMutableString *string22 = [NSMutableString stringWithString:@"hello"];
    
    //2、追加字符串
    //NSMutableString
    //+ (void)appendString:(NSString *)string;
    //- (void)appendFormat:(NSString *)format...;
    //例如：
    NSMutableString *string3 = [[NSMutableString alloc] init];
    [string3 appendString:@"hello"];
    [string3 appendString:@"money"];
    [string3 appendString:@" and world"];
    NSLog(@"string3 = %@", string3);
    
    //3、插入字符串
    //NSMutableString
    //+ (void)insertString:(NSString *)string atIndex:(unsigned)index;
    //从index位置插入字符串
    //例如：
    NSMutableString *string4 = [NSMutableString stringWithString:@"Mac X"];
    [string4 insertString:@"OS" atIndex:4];
    NSLog(@"string4 = %@", string4);
    
    //4、删除字符串
    //NSMutableString
    //+ (void)deleteCharactersInRange:(NSRange)range;
    //例如：
    NSMutableString *string5 = [NSMutableString stringWithString:@"Mac os"];
    [string5 deleteCharactersInRange:NSMakeRange(0, 1)];
    NSLog(string5);

    //5、字符串比较  NSString
    //- (BOOL)isEqualToString:(NSString *)string;
    
    //6、比较前置串和后置串 NSString
    //- (BOOL)hasPrefix:(NSString *)string;
    //- (BOOL)hasSuffix:(NSString *)string;
    //例如:
    NSString *str11 = @"Mac OS";
    NSString *str221 = @"Mac Pro";
    BOOL flag;
    flag = [str11 hasPrefix:@"Mac"];  NSLog(@"flag1 =%d y", flag);
    flag = [str221 hasSuffix:@"OS"];   NSLog(@"flag2 =%d no", flag);
    
    //7、字符串检索 NSString
    //如果找到就返回范围，否则NSRange的location项被设置为NSNotFound
    //- (NSRange)rangeOfString:(NSString *)subString;
    //- (NSRange)rangeOfString:(NSString *)subString option:(unsigned)mask;
    //- (NSRange)rangeOfString:(NSString *)subString option:(unsigned)mask range:(NSRange)range;
    
    //－－－－－mask常用选项列表
    //NSCaseInsensitiveSearch  不区分字母大小写
    //NSLiteralSearch          对字符串进行字节单位的比较，一般可提高检索速度
    //NSBackwardsSearch        从范围的末尾开始检索
    //NSAnchoredSearch        仅检索制定范围的前部。忽略字符串中间的检索字符
    //例如：
    NSString *string8 = @"hello world";
    NSRange range = [string8 rangeOfString:@"he"];
    if(range.location != NSNotFound)
    {
        NSLog(@" location=%d,length=%d",range.location,range.length);
    }
    
    //8、截取字符串  NSString
    //- (NSString *)substringToIndex:(unsigned)index;     //返回字符串开头至index位的字符串 不包含索引位
    //- (NSString *)substringFromIndex:(unsigned)index; //返回字符串第index位至末尾的字符串 包含索引位
    //- (NSString *)substringWithRange:(NSRange)range;     //返回字符串中范围range内的字符串 包含索引位
    //例如：
    NSString *string6 = [string substringWithRange:NSMakeRange(5,2)];
    
    
    //9、读取文本文件 NSString
    //+ (id)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError **)error     //自动释放内存
    
   // - (id)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error
    //例如：
    NSError * error;
    NSString *string7 = [NSString stringWithContentsOfFile:@"/user/test/yw.txt" encoding:NSUTF8StringEncoding error:&error];
    if(string){}
    
    //10、输出文本文件 NSString
    //- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error
    //参数 atomically 暂时将文件保存到辅助文件中
    //path
   // The file to which to write the receiver. If path contains a tilde (~) character, you must expand it with stringByExpandingTildeInPath before invoking this method.
    //----下面是网上找的例子 感谢 @chenshizero
    //扩展路径
    NSString *Path = @"~/NSData.txt";
    NSString *absolutePath = [Path stringByExpandingTildeInPath];
    NSLog(@"absolutePath:%@",absolutePath);
    NSLog(@"Path:%@",[absolutePath stringByAbbreviatingWithTildeInPath]);
    
    //文件扩展名
    NSString *Path1 = @"~/NSData.txt";
    NSLog(@"Extension:%@",[Path1 pathExtension]);
    
    //11、compare方法(comparer返回的三种值)
    //
    NSString *astring01 = @"2";
    NSString *astring02 = @"3";
    BOOL result = [astring01 compare:astring02] == NSOrderedSame;    //NSOrderedSame判断两者内容是否相同
    NSLog(@"=====result:%d",result);

    result = [astring01 compare:astring02] == NSOrderedAscending;    //NSOrderedAscending判断两对象值的大小(按字母顺序进行比较，astring02大于astring01为真)
    NSLog(@"====result:%d",result);
    
    result = [astring01 compare:astring02] == NSOrderedDescending;    //NSOrderedDescending判断两对象值的大小(按字母顺序进行比较，astring02小于astring01为真)
    NSLog(@"======result:%d",result);
    
    NSString *string15 = @"A String";
    NSString *string25 = @"String";
    NSLog(@"string1:%@",[string15 uppercaseString]);//大写
    NSLog(@"string2:%@",[string25 lowercaseString]);//小写
    NSLog(@"string2:%@",[string2 capitalizedString]);//首字母大小
    
    NSString *homebrew= @"ImperialIndia Pale Ale (IPA)";
    //从末尾开始搜索"ia"字符串
    NSRange range1 = [homebrew rangeOfString:@"ia" options:NSBackwardsSearch];
    //判别查找到的字符串是否正确
    if (range.length> 0)
        NSLog(@"Range is: %@", NSStringFromRange(range));
    
    int n = 2;
    
    NSLog(@"1%2d", n);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
