//
//  UITableController.m
//  projectkn
//
//  Created by xie minna on 14-9-12.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "UITableController.h"

@interface UITableController ()
{
    NSMutableArray *sections;
    NSMutableArray *rows;
}
@end

@implementation UITableController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    eCellStyle = UITableViewCellStyleDefault;
    
    //初始化两个动态数组
    sections=[[NSMutableArray alloc]init];
    rows=[[NSMutableArray alloc]init];
    
    //为两个动态数组添加对象
    [sections addObject:[NSString stringWithFormat:@"张"]];
    [sections addObject:[NSString stringWithFormat:@"李"]];
    [sections addObject:[NSString stringWithFormat:@"王"]];
    [sections addObject:[NSString stringWithFormat:@"周"]];
    
    for (int i=0; i<5; i++) {
        NSString *str=[NSString stringWithFormat:@"张 %d",i];
        [rows addObject:str];
    }
    
    for (int i=5; i<10; i++) {
        NSString *str=[NSString stringWithFormat:@"李 %d",i];
        [rows addObject:str];
    }
    for (int i=10; i<15; i++) {
        NSString *str=[NSString stringWithFormat:@"王 %d",i];
        [rows addObject:str];
    }
    for (int i=15; i<20; i++) {
        NSString *str=[NSString stringWithFormat:@"周 %d",i];
        [rows addObject:str];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)])
    {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)])
    {        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    //按照作者最后的意思还要加上下面这一段
    
    if([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]){
        
        [cell setPreservesSuperviewLayoutMargins:NO];
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [rows count]/[sections count];
}

//改变行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

//添加每个分区标题和脚本信息
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    //动态数组里面的内容
    return sections[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    return @"显示";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *TableSampleIdentifier = @"TableSampleIdentifier";
    UITableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:
                    [NSString stringWithFormat:@"%@%ld", TableSampleIdentifier, (long)indexPath.row]];
    if (indexPath.section == 0 && indexPath.row < 3) {
        if (indexPath.row == 0) {
            if (cell == nil) {
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleValue1
                        reuseIdentifier:TableSampleIdentifier];
            }
        } else if (indexPath.row == 1) {
            if (cell == nil) {
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleValue2
                        reuseIdentifier:TableSampleIdentifier];
            }
        } else if (indexPath.row == 2) {
            if (cell == nil) {
                cell = [[UITableViewCell alloc]
                        initWithStyle:UITableViewCellStyleSubtitle
                        reuseIdentifier:TableSampleIdentifier];
            }
        }
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:
                                 TableSampleIdentifier];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]
                    initWithStyle:eCellStyle
                    reuseIdentifier:TableSampleIdentifier];
        }
    }

    
    NSUInteger row = [indexPath row];
    
    //计算cell在动态数组rows中的位置（rows的值只是0，1，2，3，5.section的值只是0，1，2，3，每一个section对应rows的五个值（0，1，2，3，4））
    NSUInteger rowResult=row+(indexPath.section*5);
    
    //设置每一行（即cell）的内容如下
    cell.textLabel.text =[rows objectAtIndex:rowResult];
    //添加图片
    UIImage *image=[UIImage imageNamed:@"section0_emotion1.png"];
    cell.imageView.image=image;
    
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@ - ", [rows objectAtIndex:rowResult]];
                cell.detailTextLabel.text = @"StyleValue1";
            }
                break;
            case 1:
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@ - 1", [rows objectAtIndex:rowResult]];
                cell.detailTextLabel.text = @"StyleValue2";
            }
                break;
            case 2:
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@ -2", [rows objectAtIndex:rowResult]];
                cell.detailTextLabel.text = @"StyleSubtitle";
            }
                break;
            case 3:
            {
                cell.textLabel.text = [NSString stringWithFormat:@"%@ - StyleDefault", [rows objectAtIndex:rowResult]];
                cell.detailTextLabel.text = @"StyleDefault";
            }
                break;
            default:
                break;
        }
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView* customView = [[UIView alloc] initWithFrame:CGRectMake(10.0, 0.0, 300.0, 44.0)];
    UILabel * headerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    
    headerLabel.backgroundColor = [UIColor clearColor];
    headerLabel.opaque = NO;
    headerLabel.textColor = [UIColor lightGrayColor];
    headerLabel.highlightedTextColor = [UIColor whiteColor];
    headerLabel.font = [UIFont boldSystemFontOfSize:18];
    headerLabel.frame = CGRectMake(10.0, 0.0, 300.0, 44.0);
    if (section == 0) {
        
        headerLabel.text =  @"测试1";
        
    }else if (section == 1){
        
        headerLabel.text = @"测试2";
        
    }else if (section == 2){
        
        headerLabel.text = @"测试3";
        
    } else if (section == 3){
        
        headerLabel.text = @"测试4";
    }

    [customView addSubview:headerLabel];
    return customView;
    
}

//别忘了设置高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section

{
    
    return 44.0;
    
}

//行缩进
-(NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    
    return row;
    
}

 -(void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 0:
            {
                eCellStyle = UITableViewCellStyleDefault;
            }
                break;
            case 1:
            {
                eCellStyle = UITableViewCellStyleValue1;
            }
                break;
            case 2:
            {
                eCellStyle = UITableViewCellStyleValue2;
            }
                break;
            case 3:
            {
                eCellStyle = UITableViewCellStyleSubtitle;
            }
                break;
                
            default:
                break;
        }
        [tableView reloadData];
    } else {
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        cell.textLabel.text = @"xxx";
        NSArray *indexArray = [NSArray arrayWithObject:indexPath];
        [tableView  reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sections;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    NSLog(@"%i", index);
    
    return index;
    
}

//去掉; headerview黏性(sticky)
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.tableView)
    {
        CGFloat sectionHeaderHeight = 44; //sectionHeaderHeight
        if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
            scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
        } else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
            scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
        }
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */


@end
