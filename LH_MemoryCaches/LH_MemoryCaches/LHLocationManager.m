//
//  LHLocationManager.m
//  LH_MemoryCaches
//
//  Created by lh on 17/3/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "LHLocationManager.h"
#define ALERT_MSG(msg)                                                                                                                   \
static UIAlertView *alert;                                                                                                           \
alert = [[UIAlertView alloc] initWithTitle:nil message:msg delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil]; \
[alert show];

@interface LHLocationManager()<CLLocationManagerDelegate>
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic, assign) UIBackgroundTaskIdentifier taskIdentifier;
@end
@implementation LHLocationManager

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}

+ (instancetype)sharedManager
{
    static LHLocationManager *instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LHLocationManager alloc] init];
    });
    
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if ( self )
    {
        self.minSpeed = 3;
        self.minFilter = 2000;
        self.minInteval = 10;
        self.delegate = self;
        self.distanceFilter  = kCLDistanceFilterNone;
        self.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return self;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = locations[0];
    [self.dataArray addObject:location];
    NSLog(@"%@---%ld",location,self.dataArray.count);
    NSString *str = [NSString stringWithFormat:@"%ld",self.dataArray.count];
//    ALERT_MSG(str);
    [self uploadLocation:location];
}

- (void)uploadLocation:(CLLocation*)location
{
    if ( [UIApplication sharedApplication].applicationState == UIApplicationStateActive )
    {
        [self endBackgroundUpdateTask];
    }
    else
    {
        //假如上一次的上传操作尚未结束 则直接return
        if ( self.taskIdentifier != UIBackgroundTaskInvalid )
        {
            return;
        }

        [self beingBackgroundUpdateTask];

        //TODO HTTP upload
        //上传完成记得调用 [self endBackgroundUpdateTask];
    }

}
- (void)beingBackgroundUpdateTask
{
    self.taskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
    
}

- (void)endBackgroundUpdateTask
{
    if ( self.taskIdentifier != UIBackgroundTaskInvalid )
    {
        [[UIApplication sharedApplication] endBackgroundTask: self.taskIdentifier];
        self.taskIdentifier = UIBackgroundTaskInvalid;
    }
    
}
@end
