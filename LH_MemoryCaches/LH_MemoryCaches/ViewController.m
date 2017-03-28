//
//  ViewController.m
//  LH_MemoryCaches
//
//  Created by lh on 17/3/20.
//  Copyright © 2017年 lh. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()
@property (nonatomic,strong) CMAltimeter *altimeter;
@end

@implementation ViewController

- (CMAltimeter *)altimeter {
    if (!_altimeter) {
        _altimeter = [[CMAltimeter alloc]init];
    }
    return _altimeter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
   
}

- (void)testPress{
    if (![CMAltimeter isRelativeAltitudeAvailable]) {
        NSLog(@"Barometer is not available on this device. Sorry!");
        return;
    }else{
        NSLog(@"Barmoter is available on this device");
        [self.altimeter startRelativeAltitudeUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAltitudeData * _Nullable altitudeData, NSError * _Nullable error) {
            
            // 实时刷新数据
            [self update:altitudeData];
            
        }];
    }
}

-(void)update:(CMAltitudeData *)altitudeData {
    NSLog(@"%dm        ----%dkpa",[altitudeData.relativeAltitude intValue],[altitudeData.pressure intValue]);
    
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
