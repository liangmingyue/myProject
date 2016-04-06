//
//  BlockViewController.m
//  projectkn
//
//  Created by xie minna on 14-12-4.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "BlockViewController.h"

@implementation BlockViewController
int global = 1000;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"blockImage."]];
    
    //在代码块中可以使用和改变全局变量
    void(^block)(void) = ^(void)
    {
        global++;
        NSLog(@"global:%d", global);
    };
    block();
    NSLog(@"global:%d", global);
    
    //在代码块中改变局部变量编译不通过。怎么在代码块中改变局部变量呢？在局部变量前面加上关键字：__block
    __block int local = 500;
    void(^localBlock)(void) = ^(void)
    {
        local++;
        NSLog(@"local:%d", local);
    };
    localBlock();
    NSLog(@"local:%d", local);
    
    //参数是NSString*的代码块
    void (^printString)(NSString *printStr);
    
    printString =  ^(NSString *printStr){ NSLog(@"print = %@", printStr);};
    
    printString(@"iiii doo noo");
    
    //代码用在字符串数组排序
    NSArray *soryArry = [NSArray arrayWithObjects:@"abc 1", @"abc 21", @"abc 12",@"abc 13",@"abc 05", nil];
    NSComparator arraySortBlok = ^(id string1, id string2)
    {
        return [string1 compare:string2];
    };
    
    NSArray *sortArray = [soryArry sortedArrayUsingComparator:arraySortBlok];
    NSLog(@"sortArray:%@", sortArray);

    //代码块的递归调用
    static void (^blocks)(int) = ^(int i){
        if (i > 0) {
            NSLog(@"num = %d", i);
            blocks(i -2);
        }
    };
    
    blocks(5);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
