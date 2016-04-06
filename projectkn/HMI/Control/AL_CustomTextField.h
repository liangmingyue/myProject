//
//  AL_CustomTextField.h
//  ALMainMenu
//
//  Created by minna.xie on 16/3/18.
//  Copyright © 2016年 yuhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AL_CustomTextField : UITextField

- (id)initWithFrame:(CGRect)frame withPlaceholder:(NSString *)placeholder withBackImage:(UIImage *)imge;

//显示隐藏状态
-(void) hiddenSearchAnimation;

-(void) searchAnimation;

@end
