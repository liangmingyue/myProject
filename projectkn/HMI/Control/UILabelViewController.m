//
//  UILabelViewController.m
//  projectkn
//
//  Created by xie minna on 14-2-8.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UILabelViewController.h"
#import "AttributedLabel.h"
#import "MZSelectableLabel.h"
#import "MarkupParser.h"
#import "CustomLabel.h"

@interface UILabelViewController ()

@end

@implementation UILabelViewController

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
    self.title = @"UILabel控件";
    self.navigationItem.leftBarButtonItem =  [[UIBarButtonItem alloc]
                                           initWithTitle:@"左按钮"
                                           style:UIBarButtonItemStylePlain
                                           target:self
                                           action:@selector(leftBtnEvent:)];
    [self UILableStudy];
	// Do any additional setup after loading the view.
}

-(void)leftBtnEvent:(id)object
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UILabel *)createUILable
{
    UILabel *lbMyLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 300, 20)];
    lbMyLabel.backgroundColor = [UIColor lightGrayColor];
    lbMyLabel.textColor = [UIColor purpleColor];
    
    return lbMyLabel;
}

-(void)UILableStudy
{
    NSString *text = @"Hello <font color=\"red\">core text <font color=\"black\">world!Hello core text world!";//[NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    MarkupParser *p = [[MarkupParser alloc] init];
    NSAttributedString *attString = [p attrStringFromMarkup:text];
    
    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"Hello core text world!Hello core text world! attriString = this is test!ddHello core text world!Hello core text world! attriString = this is test!dd"];
    //把this的字体颜色变为红色
    [attriString addAttribute:(NSString *)kCTForegroundColorAttributeName
                        value:(id)[UIColor redColor].CGColor
                        range:NSMakeRange(4, 5)];
    //改变this的字体，value必须是一个CTFontRef
    [attriString addAttribute:(NSString *)kCTFontAttributeName
                        value:(id)CFBridgingRelease(CTFontCreateWithName((CFStringRef)[UIFont boldSystemFontOfSize:30].fontName, 14, NULL))
                        range:NSMakeRange(0, [attriString.string length])];
    
    NSLog(@"string = %@ attriString = %@", attString.string, attriString.string);
    
    CustomLabel *customLabel = [[CustomLabel alloc] initWithFrame:CGRectMake(0, 100, 300, 200)];
    customLabel.font = [UIFont systemFontOfSize:20];
    [customLabel setAttString:attriString];
    [self.view addSubview:customLabel];
    
    int i = 2;
     UILabel *lbMyLabel = [self createUILable];
    lbMyLabel.frame = CGRectMake(20, 300, 280, 20);
    lbMyLabel.text = @"NSLineBreakByWordWrapping：，我们将根据要求的字体大小，来计算实际需要的长度或者是高度！";
    //设置文字位置
    lbMyLabel.textAlignment = NSTextAlignmentCenter;
    lbMyLabel.font  = [UIFont boldSystemFontOfSize:20];
    //设置字体大小适应label宽度
    lbMyLabel.adjustsFontSizeToFitWidth = YES;
    //设置高亮
    lbMyLabel.highlighted = YES;
    lbMyLabel.highlightedTextColor = [UIColor orangeColor];
    lbMyLabel.adjustsFontSizeToFitWidth = YES;//调整基线位置需将此属性设置为YES
    lbMyLabel.baselineAdjustment = UIBaselineAdjustmentNone;
//    此属性有三个值可选
//    UIBaselineAdjustmentAlignBaselines //文本最上端与Label中线对齐，默认值
//    UIBaselineAdjustmentAlignCenters   //文本中线与Label中线对齐
//    UIBaselineAdjustmentNone           //文本最下端与Label中线对齐
//    最小字体大小，当字体小于这个最小值时无效，显示此属性值  iOS6.0之前：minimumFontSize  iOS6.0之后：minimumScaleFactor
    lbMyLabel.minimumScaleFactor = 10.0f;//默认值为0，为当前字体大小
    lbMyLabel.numberOfLines = 2;//Label行数
    //设置高亮
    lbMyLabel.shadowColor = [UIColor redColor];
    lbMyLabel.shadowOffset = CGSizeMake(1.0, 1.0);
    //设置是否能与用户进行交互
    lbMyLabel.userInteractionEnabled = YES;
    //设置label中的文字是否可变，默认值是YES
    lbMyLabel.enabled = NO;
    //设置文字过长时的显示格式
    [self.view addSubview:lbMyLabel];
    
    //    NSLineBreakByWordWrapping = 0 //以空格为边界，保留单词。
    //    NSLineBreakByCharWrapping //保留整个字符
    //    NSLineBreakByClipping //简单剪裁，到边界为止
    //    NSLineBreakByTruncatingHead //前面部分文字以……方式省略，显示尾部文字内容
    //    NSLineBreakByTruncatingTail //结尾部分的内容以……方式省略，显示头的文字内容。
    //    NSLineBreakByTruncatingMiddle //中间的内容以……方式省略，显示头尾的文字内容。
    i++;
    UILabel *lbMyLabel0 = [self createUILable];
    lbMyLabel0.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel0.text = @"WordWrapping:以空格为边界，保留单词！";
    lbMyLabel0.lineBreakMode = NSLineBreakByWordWrapping;
    [self.view addSubview:lbMyLabel0];
    
    i++;
    UILabel *lbMyLabel1 = [self createUILable];
    lbMyLabel1.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel1.text = @"NSLineBreakByCharWrapping:保留整个字符！";
    lbMyLabel1.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:lbMyLabel1];
    
    i++;
    UILabel *lbMyLabel2 = [self createUILable];
    lbMyLabel2.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel2.text = @"Clipping:简单剪裁，到边界为止！";
    lbMyLabel2.lineBreakMode = NSLineBreakByClipping;
    [self.view addSubview:lbMyLabel2];
    
    i++;
    UILabel *lbMyLabel3 = [self createUILable];
    lbMyLabel3.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel3.text = @"TruncatingHead:前面部分文字以……方式省略，显示尾部文字内容！";
    lbMyLabel3.lineBreakMode = NSLineBreakByTruncatingHead;//截去中
    [self.view addSubview:lbMyLabel3];
    
    i++;
    UILabel *lbMyLabel4 = [self createUILable];
    lbMyLabel4.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel4.text = @"TruncatingTail:结尾部分的内容以……方式省略，显示头的文字内容！";
    lbMyLabel4.lineBreakMode = NSLineBreakByTruncatingTail;//截去中
    [self.view addSubview:lbMyLabel4];
    
    i++;
    UILabel *lbMyLabel5 = [self createUILable];
    lbMyLabel5.frame = CGRectMake(20, 10 + i * 30, 250, 20);
    lbMyLabel5.text = @"TruncatingMiddle:中间的内容以……方式省略，显示头尾的文字内容";
    lbMyLabel5.lineBreakMode = NSLineBreakByTruncatingMiddle;//截去中
    [self.view addSubview:lbMyLabel5];
    
    UILabel *lbMyLabel6 = [self createUILable];
    UIFont* theFont = [UIFont systemFontOfSize:14];
    lbMyLabel6.font = theFont;
    lbMyLabel6.frame = CGRectMake(20, 330, 250, 20);
    NSString *strText = @"这是一段很长的字符串，我们将根据要求的字体大小，来计算实际需要的长度或者是高度！";
    lbMyLabel6.text = strText;
    lbMyLabel6.numberOfLines = 2;
    //计算文本的宽度
    CGSize sizeName = [strText sizeWithFont:theFont
                          constrainedToSize:CGSizeMake(MAXFLOAT, 0.0)
                              lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"%@", NSStringFromCGSize(sizeName));
    lbMyLabel6.frame = CGRectMake(lbMyLabel6.frame.origin.x, lbMyLabel6.frame.origin.y, sizeName.width, sizeName.height);
    [self.view addSubview:lbMyLabel6];
    
    //计算文本的高度
    sizeName = [strText sizeWithFont:theFont
                          constrainedToSize:CGSizeMake(250, MAXFLOAT)
                              lineBreakMode:NSLineBreakByWordWrapping];
    lbMyLabel6.frame = CGRectMake(lbMyLabel6.frame.origin.x, lbMyLabel6.frame.origin.y, sizeName.width, sizeName.height);
    
    UIFont *font = [UIFont fontWithName:@"Arial" size:20.0f];
    lbMyLabel.shadowColor = [UIColor redColor];
    lbMyLabel.shadowOffset = CGSizeMake(-5, -5);
    CGFloat f = 0.0f;
    //指定了应该显示的字体,最小的字体,实际的字体,在实际计算中,如果宽度不够,则尽量缩小字符串的字体直至能够一行全部显示,如果缩到最小还不能完全显示字符串,则进行截断,返回截断后的字符串的高度和宽度
    //字体实际的大小,存放在 actualFontSize里
    CGSize size4 = [strText sizeWithFont:font
                          minFontSize:10.0f
                       actualFontSize:&f
                             forWidth:100.0f
                        lineBreakMode:NSLineBreakByWordWrapping];
    
    AttributedLabel *label = [[AttributedLabel alloc] initWithFrame:CGRectMake(20, 400, 300, 100)];
    // 注意！！一定要先给text赋值，然后再加属性；
    label.text = @"This is a stringThis is a stringThis is a stringThis is a stringThis is a string";
    label.numberOfLines = 0;
    label.adjustsFontSizeToFitWidth = YES;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    [self.view addSubview:label];
    
    // 设置this为红色
    [label setColor:[UIColor redColor] fromIndex:0 length:4];
    // 设置is为黄色
    [label setColor:[UIColor orangeColor] fromIndex:5 length:5];
    // 设置this字体为加粗16号字
    // 给this加上下划线
    [label setStyle:kCTUnderlineStyleDouble fromIndex:0 length:4];
    label.backgroundColor = [UIColor clearColor];
    
    NSString*string1 = @"This is a stringThis is a stringThis is a stringThis is a stringThis is a string";
    NSString*string2 = @"string";
    NSRange range = [string1 rangeOfString:string2];
    MZSelectableLabel *labelx = [[MZSelectableLabel alloc] initWithFrame:CGRectMake(20, 450, 300, 40)];
    labelx.numberOfLines = 0;
    labelx.font = [UIFont systemFontOfSize:20];
    labelx.lineBreakMode = NSLineBreakByCharWrapping;
    labelx.attributedText = [[NSMutableAttributedString alloc] initWithString:string1];
    [labelx setSelectableRange:range];
    // to respond to links being touched by the user.
    labelx.selectionHandler = ^(NSRange range, NSString *string) {
        // Put up an alert with a message if it's not an URL
        NSString *message = [NSString stringWithFormat:@"You tapped %@", string];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hello"
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"Dismiss"
                                              otherButtonTitles:nil];
        [alert show];
    };
    
    //    Uncomment to automatic detection!
//    labelx.skipColorForAutomaticDetection = [UIColor blackColor];
//    labelx.automaticDetectionBackgroundHighlightColor = [UIColor lightGrayColor];
//    labelx.automaticForegroundColorDetectionEnabled = YES;
//    [[labelx.attributedText string] rangeOfString:@"Tap me"]
    
    if (!labelx.automaticForegroundColorDetectionEnabled) {
        [labelx setSelectableRange:range];
        [labelx setSelectableRange:range hightlightedBackgroundColor:[UIColor colorWithWhite:0.3 alpha:0.3]];
    }
    
    [self.view addSubview:labelx];
    
    UILabel *lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 400, 300, 60)];
    lb.text = @"Swift虽然仅仅只开源了两个星期，但是开源社区已经在不停向这个项目贡献代码了。这个博客现在每周会将Swift开源中的重要讨论和提交整理成Open source Swift weekly brief，这对一线开发者尽早了解这门语言的动态情报很有帮助";
    lb.shadowColor = [UIColor redColor];
    lb.shadowOffset = CGSizeMake(-5, -5);
    lb.numberOfLines = 0;
    [self.view addSubview:lb];
    lb.backgroundColor = [UIColor orangeColor];
    CGSize size = [lb.text sizeWithFont:lb.font constrainedToSize:CGSizeMake(300, 1000) lineBreakMode:NSLineBreakByCharWrapping];
    lb.frame = CGRectMake(1, 400, size.width, size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
