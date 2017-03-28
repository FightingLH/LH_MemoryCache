//
//  BottomViewController.m
//  LH_MemoryCaches
//
//  Created by lh on 17/3/24.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "BottomViewController.h"
#import "SecondViewController.h"
#import <MapKit/MapKit.h>
@interface BottomViewController ()
@end

@implementation BottomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self configUI];
}

- (void)configUI{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height - 80),80,80);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(toNextController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    self.cell = button;
}

- (void)toNextController{
    SecondViewController *presentVC = [SecondViewController new];
    [self presentViewController:presentVC animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
