//
//  NSarrayViewController.m
//  projectkn
//
//  Created by xie minna on 14-10-9.
//  Copyright (c) 2014年 xie minna. All rights reserved.
//

#import "NSarrayViewController.h"

@interface NSarrayViewController ()

@end

@implementation NSarrayViewController

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
    //http://blog.csdn.net/shx_yi/article/details/8687368
     NSArray *array = [NSArray arrayWithObjects:@"wendy",@"andy",@"tom",@"jonery",@"stany", nil];
    /**
     * 1、获取数组中总共有多少个对象。
     * - (NSUInteger)count;
     */
    NSLog(@"%lu",(unsigned long)[array count]);
    
    /**
     * 2、获取数组中下标对应的元素对象.(下标是从0开始)
     * - (id)objectAtIndex:(NSUInteger)index;
     */
    NSLog(@"%@", [array objectAtIndex:0]);
    
    /**
     * 3、在当前数据中追加一个新的对象，并且返回一个新的数据对象(新的数组对象和被追加的对象，
     * 是两个不同的数组对象)。
     * - (NSArray *)arrayByAddingObject:(id)anObject;
     */
    NSArray *newArray = [array arrayByAddingObject:@"XXXX"];
    NSLog(@"newArray = %@", newArray);
    
    /**
     * 4、在当前的数组中追加一个新的数据，并且返回一个新的数组对象。
     * - (NSArray *)arrayByAddingObjectsFromArray:(NSArray *)otherArray;
     **/
    NSArray *addNew = [array arrayByAddingObjectsFromArray:newArray];
    NSLog(@"newArray = %@", addNew);
    
    /**
     * 5、使用当前的数组生成一个字符串，新生成的字符串使用提供的separator 字符进行分割。
     * - (NSString *)componentsJoinedByString:(NSString *)separator;
     **/
     NSString *string = [array componentsJoinedByString:@","];
    NSLog(@"string = %@", string);
      //运行结果: wendy,andy,tom,jonery,stany
    
    /**
     * 6、检测数据中是否包含指定的对象元素
     * - (BOOL)containsObject:(id)anObject;
     **/
    [array containsObject:@"tom"];
    //return YES
    
    /**
     * 7、使用当前的数组生成字符串。可以重写description 改变生成的字符串。相当于java 中的toString 方法。
     * - (NSString *)description;
     **/
    NSLog(@"description = %@", [array description]);
    
    /**
     * 8、根据设置的locale 进行连接数组
     * - (NSString *)descriptionWithLocale:(id)locale;
     * - (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level;
     */
    
//    9、两个数组的第一个元素是否相同，如果相同，则返回 数组中，第一个元素的字符串，反之，返回null 对象
//    - (id)firstObjectCommonWithArray:(NSArray *)otherArray;
//    10、 从数组中获取 NSRange 对象的数据存放到objects 中，NSRange 的数据标示从location,开始后面length 个数据
//    - (void)getObjects:(id__unsafe_unretained [])objects range:(NSRange)range;
//    
//    
//    NSArray *array = [NSArray arrayWithObjects:@"wendy",@"andy",@"tom",@"jonery",@"stany",@"张山名称",@"asdta", nil];
//    
//    NSRange range = NSMakeRange(1, 5);
//    
//    id *objects;
//    
//    objects = malloc(sizeof(id) * range.length);
//    
//    [array getObjects:objects range:range];
//    
//    for(int i = 0; i < range.length; i++){
//        NSLog(@"%@",objects[i]);
//    }
//    
//    free(objects);
//    
//    运行的结果
//    
//    andy
//    tom
//    jonery
//    stany
//    11、 判断制定的anObject 对象是否存在数组中如果存在返回，对象所在的下标
//    - (NSUInteger)indexOfObject:(id)anObject;
//    如果不存在，返回的NSUInteger 与 NSNotFund 相同
//    NSUIndex index = [array indexOfObject:@"stan"];
//    if(index == NSNotFound)
//    {
//        对象不在数组中
//    }
//    
//    11-1、 判断制定的元素，是否在数组中，数组查询的位置，是从range.location 的位置开始，到range.length 的长度结束。
//    - (NSUInteger)indexOfObject:(id)anObject inRange:(NSRange)range;
//    如果数据存在，返回指定的下标，如果不存在，则返回NSNotFund 。
//    实质是使用isEqual 进行比较
//    
//    
//    12、
//    同上面两个方法一项，测试指定的对象是否在数组中不同的是，这里使用指针进行比较
//    - (NSUInteger)indexOfObjectIdenticalTo:(id)anObject;
//    如果数据存在，返回指定的下标，如果不存在，则返回NSNotFund 。
//    - (NSUInteger)indexOfObjectIdenticalTo:(id)anObject inRange:(NSRange)range;
//    
//    
//    13、比较两个数组是否相同 ，数组长度相同，并且相同位置上的元素也相同。
//    - (BOOL)isEqualToArray:(NSArray *)otherArray;
//    14、返回最有一个元素，如果一个数组的长度为0 返回的对象为nil
//    - (id)lastObject;
//    15、使用数组返回一个 NSEnumerator 对象，这个对象类似与一个指针，可以用来遍历 整个数组 指针从前向后遍历
//    - (NSEnumerator *)objectEnumerator;
//    示例如下
//    NSEnumerator *enu = [array objectEnumerator];
//    
//    id *obj;
//    while (obj = enu.nextObject) {
//        NSLog(@"obj===%@==",obj);
//    }
//    16、 返回一个NSEnumerator 对象，这个对象类似一个指针，可以用来遍历真个数据，所不同的是，这个指针，是从后向前遍历。
//    - (NSEnumerator *)reverseObjectEnumerator;
//    17、生成一个NSData 的对象，主要是用来进行数组的排序。 在下面的方法中使用这个对象
//    - (NSData *)sortedArrayHint;
//    18、 进行数组的排序
//    - (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id,id, void *))comparator context:(void *)context;
//    这个方法类似苹果实现了一个简单的 排序方法。但是实现的规则需要自己进行处理。
//    类似的方法如下。 首先提供一个 普通的排序算法，函数和c 的方法类似
//    NSInteger sortType(id st,id str,void *cha)
//    {
//        NSString *s1 = (NSString *)st;
//        NSString *s2 = (NSString *)str;
//        
//        
//        if(s1.length > s2.length)
//        {
//            return NSOrderedAscending;
//        }else if(s1.length < s2.length)
//        {
//            return NSOrderedDescending;
//        }
//        
//        return NSOrderedSame;
//    }
//    
//    
//    NSArray *array = [NSArray arrayWithObjects:@"wendy",@"andy",@"tom",@"test", nil];
//    
//    NSArray *a = [array sortedArrayUsingFunction:sortType context:nil];
//    
//    NSLog(@"a=%@",a);
//    NSArray 为需要排序的数组，返回一个排序完成的数组，再执行osrtedArrayUseingFunction 方法时会，会自动调用上面的sortType 方法，并且，可以按照你
//    的需要调整上面的规则
//    
//    
//    19、和上面的方法类似，也是苹果用来进行排序的。所不同的是，需要传入一个NSData 的数据。
//    - (NSArray *)sortedArrayUsingFunction:(NSInteger (*)(id,id, void *))comparator context:(void *)context hint:(NSData *)hint;
//    
//    
//    NSData *dat = [array sortedArrayHint];
//    NSArray *a = [array sortedArrayUsingFunction:sortType context:nil hint:dat];
//    
//    NSLog(@"a=%@",a);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
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
