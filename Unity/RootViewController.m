//
//  RootViewController.m
//  Unity
//
//  Created by mgfjx on 2016/12/14.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController (){
    UIButton *_btn;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor randomColorWithAlpha:0.5];
    
    [self.view addSubview:btn];
    
    _btn = btn;
    
    [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(btnClicked) userInfo:nil repeats:YES];
    
}

- (void)btnClicked{
    
    
    
}

@end
