//
//  AN_LocationManager.m
//  AN_Companion_IOS
//
//  Created by chenjie on 2/17/15.
//  Copyright (c) 2015 chenjie. All rights reserved.
//

#import "AN_LocationManager.h"
@interface AN_LocationManager ()
{
    CLLocationManager *_manager;
}

@property (nonatomic, copy) LocationBlock locationBlock;
@property (nonatomic, copy) NSStringBlock cityBlock;
@property (nonatomic, copy) NSStringBlock addressBlock;
@property (nonatomic, copy) LocationErrorBlock errorBlock;

@end

@implementation AN_LocationManager

+ (AN_LocationManager *)shareLocation
{
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    
    return _sharedObject;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
        
        float longitude = [standard floatForKey:CCLastLongitude];
        float latitude = [standard floatForKey:CCLastLatitude];
        self.longitude = longitude;
        self.latitude = latitude;
        self.lastCoordinate = CLLocationCoordinate2DMake(longitude,latitude);
        self.lastCity = [standard objectForKey:CCLastCity];
        self.lastAddress=[standard objectForKey:CCLastAddress];
    }
    
    return self;
}

//获取经纬度
- (void)getLocationCoordinate:(LocationBlock)locaiontBlock
{
    self.locationBlock = locaiontBlock;
    [self startLocation];
}

- (void)getLocationCoordinate:(LocationBlock) locaiontBlock  withAddress:(NSStringBlock) addressBlock
{
    self.locationBlock = locaiontBlock ;
    self.addressBlock = addressBlock;
    [self startLocation];
}

- (void)getAddress:(NSStringBlock)addressBlock
{
    self.addressBlock = addressBlock;
    [self startLocation];
}

//获取省市
- (void)getCity:(NSStringBlock)cityBlock
{
    self.cityBlock = cityBlock;
    [self startLocation];
}

- (void)getCity:(NSStringBlock)cityBlock error:(LocationErrorBlock) errorBlock
{
    self.cityBlock = cityBlock;
    self.errorBlock = errorBlock;
    [self startLocation];
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSUserDefaults *standard = [NSUserDefaults standardUserDefaults];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks,NSError *error)
     {
         NSLog(@"reverseGeocodeLocation:completionHandler: Completion Handler called!");
         
         if (error){
             NSLog(@"Geocode failed with error: %@", error);
         }
         
         if (placemarks.count > 0)
         {
             CLPlacemark *placemark = [placemarks objectAtIndex:0];
             _lastCity = [NSString stringWithFormat:@"%@%@",placemark.administrativeArea,placemark.locality];
             [standard setObject:_lastCity forKey:CCLastCity];//省市地址
             NSLog(@"City = %@",_lastCity);
             
             _lastAddress = [NSString stringWithFormat:@"%@%@%@%@%@%@",placemark.country,placemark.administrativeArea,placemark.locality,placemark.subLocality,placemark.thoroughfare,placemark.subThoroughfare];//详细地址
             NSLog(@"Address = %@",_lastAddress);
         }
         
         if (_cityBlock)
         {
             _cityBlock(_lastCity);
             _cityBlock = nil;
         }
         if (_addressBlock)
         {
             _addressBlock(_lastAddress);
             _addressBlock = nil;
         }
     }];
    
    _lastCoordinate = CLLocationCoordinate2DMake(newLocation.coordinate.latitude ,newLocation.coordinate.longitude );
    if (_locationBlock)
    {
        _locationBlock(_lastCoordinate);
        _locationBlock = nil;
    }
    
    NSLog(@"%f--%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    [standard setObject:@(newLocation.coordinate.latitude) forKey:CCLastLatitude];
    [standard setObject:@(newLocation.coordinate.longitude) forKey:CCLastLongitude];
    
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status

{
    switch (status) {
            
        case kCLAuthorizationStatusNotDetermined:
            
            if ([manager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                
                [manager requestWhenInUseAuthorization];
            }
            
            break;
            
        default:
            
            break;
            
    }
}

-(void)startLocation
{
    if([CLLocationManager locationServicesEnabled] && [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied)
    {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        _manager.distanceFilter = 100;
        if (IOS_VERSION > 8.0f)
        {
            [UIApplication sharedApplication].idleTimerDisabled = TRUE;
            [_manager requestAlwaysAuthorization];        //NSLocationAlwaysUsageDescription
            [_manager requestWhenInUseAuthorization];     //NSLocationWhenInUseDescription
        }
        [_manager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (_errorBlock)
    {
        _errorBlock(error);
        _cityBlock = nil;
    }
    [self stopLocation];
}

-(void)stopLocation
{
    _manager = nil;
}

@end
