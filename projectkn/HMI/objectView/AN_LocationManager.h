//
//  AN_LocationManager.h
//  AN_Companion_IOS
//
//  Created by chenjie on 2/17/15.
//  Copyright (c) 2015 chenjie. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define  CCLastLongitude @"CCLastLongitude"
#define  CCLastLatitude  @"CCLastLatitude"
#define  CCLastCity      @"CCLastCity"
#define  CCLastAddress   @"CCLastAddress"

typedef void (^LocationBlock)(CLLocationCoordinate2D locationCorrrdinate);
typedef void (^LocationErrorBlock) (NSError *error);
typedef void (^NSStringBlock)(NSString *cityString);
typedef void (^NSStringBlock)(NSString *addressString);

@interface AN_LocationManager : NSObject<CLLocationManagerDelegate>

@property (nonatomic)CLLocationCoordinate2D lastCoordinate;
@property (nonatomic,copy)NSString *lastCity;
@property (nonatomic,copy)NSString *lastAddress;
@property (nonatomic,assign)float latitude;
@property (nonatomic,assign)float longitude;

+ (AN_LocationManager *)shareLocation;

/**
 *  获取坐标
 *
 *  @param locaiontBlock locaiontBlock description
 */
- (void)getLocationCoordinate:(LocationBlock)locaiontBlock;

/**
 *  获取坐标和详细地址
 *
 *  @param locaiontBlock locaiontBlock description
 *  @param addressBlock  addressBlock description
 */
- (void)getLocationCoordinate:(LocationBlock)locaiontBlock withAddress:(NSStringBlock)addressBlock;

/**
 *  获取详细地址
 *
 *  @param addressBlock addressBlock description
 */
- (void)getAddress:(NSStringBlock)addressBlock;

/**
 *  获取城市
 *
 *  @param cityBlock cityBlock description
 */
- (void)getCity:(NSStringBlock)cityBlock;

/**
 *  获取城市和定位失败
 *
 *  @param cityBlock  cityBlock description
 *  @param errorBlock errorBlock description
 */
- (void)getCity:(NSStringBlock)cityBlock error:(LocationErrorBlock) errorBlock;

@end
