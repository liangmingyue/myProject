//
//  LocationView.m
//  projectkn
//
//  Created by minna.xie on 6/2/15.
//  Copyright (c) 2015 xie minna. All rights reserved.
//

#import "LocationView.h"
#import "AN_LocationManager.h"

@implementation LocationView

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    [[AN_LocationManager shareLocation]getCity:^(NSString *cityString) {
        NSLog(@"city === %@", cityString);
    }];
}

@end
