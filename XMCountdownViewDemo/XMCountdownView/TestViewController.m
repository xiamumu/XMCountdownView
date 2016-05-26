//
//  ViewController.m
//  XMCountdownView
//
//  Created by 21_xm on 16/5/25.
//  Copyright © 2016年 sean.xia. All rights reserved.
//

#import "TestViewController.h"
#import "XMCountdownView.h"


@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 可修改数字显示区的背景图片，数字大小，数字颜色，数字高度，宽度。
    // 文字区域可以设置替换成其他文字，可以设置文字颜色，大小。
    // 整体可以设置位置显示，宽、设置无效，可以根据传入的时间戳自动转换成天、时、分显示，并且按照设置的时长倒计时


    XMCountdownView *countdown = [[XMCountdownView alloc] init];
    countdown.frame = CGRectMake(50, 200, 400, 400);
    countdown.countDownTime = @"1478573090";
    countdown.interval = 5;
    countdown.subNumFont = [UIFont systemFontOfSize:30];
    countdown.titleColor = [UIColor orangeColor];
    countdown.titleFont = [UIFont systemFontOfSize:25];
    countdown.subNumHeight = 50;
    countdown.subNumWidth = 30;
    countdown.titles = @[@"H", @"M", @"S"];
//    countdown.backgroundColor = [UIColor redColor];
//    countdown.backgroundImage = [UIImage imageNamed:@"timeLabel_bg"];
//    countdown.subNumColor = [UIColor redColor];
//    countdown.subNumBackgroundImage = [UIImage imageNamed:@"tiexian_bg"];
    [self.view addSubview:countdown];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
