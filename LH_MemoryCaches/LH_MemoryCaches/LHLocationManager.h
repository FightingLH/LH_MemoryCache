//
//  LHLocationManager.h
//  LH_MemoryCaches
//
//  Created by lh on 17/3/23.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
@import UIKit;
@interface LHLocationManager : CLLocationManager

+ (instancetype)sharedManager;

@property (nonatomic, assign) CGFloat minSpeed;
@property (nonatomic, assign) CGFloat minFilter;
@property (nonatomic, assign) CGFloat minInteval;
@end
