//
//  SecondViewController.m
//  LH_MemoryCaches
//
//  Created by lh on 17/3/28.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "SecondViewController.h"
#import "MapSpreadTransition.h"

@interface SecondViewController ()<UIViewControllerTransitioningDelegate>
@end

@implementation SecondViewController

- (void)dealloc{
    NSLog(@"dealloc");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.transitioningDelegate = self;
        self.modalPresentationStyle = 5;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 50, self.view.frame.size.width, 50);
    [self.view addSubview:button];
    
}

//
- (void)pushNextViewControoler{
    
}

- (void)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [MapSpreadTransition transitionWithTransitionType:MapSpreadTransitionTypePresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [MapSpreadTransition transitionWithTransitionType:MapSpreadTransitionTypeDismiss];
}


@end
