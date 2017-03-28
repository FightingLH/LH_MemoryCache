//
//  MapSpreadTransition.h
//  LH_MemoryCaches
//
//  Created by lh on 17/3/24.
//  Copyright © 2017年 lh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, MapSpreadTransitionType) {
    MapSpreadTransitionTypePresent = 0,
    MapSpreadTransitionTypeDismiss
};
@interface MapSpreadTransition : NSObject<UIViewControllerAnimatedTransitioning,CAAnimationDelegate>

@property (nonatomic, assign) MapSpreadTransitionType type;

+ (instancetype)transitionWithTransitionType:(MapSpreadTransitionType)type;
- (instancetype)initWithTransitionType:(MapSpreadTransitionType)type;
@end
