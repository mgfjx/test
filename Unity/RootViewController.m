//
//  RootViewController.m
//  Unity
//
//  Created by mgfjx on 2016/12/14.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import "RootViewController.h"
#import "AutoScrollLabel.h"

@interface RootViewController (){
    UIView *animationView;
    UIButton *button;
    CGPoint animationPoint;
}

@property (nonatomic, strong) UISlider *slider;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 创建Button
    button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.layer.borderWidth = 0.5f;
    button.layer.cornerRadius = 7.0f;
    button.frame = CGRectMake(240, 100, 60, 25);
    [button setTitle:@"动画" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)test {
    
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(20, 200, self.view.width - 20*2, 30);
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.backgroundColor = [UIColor randomColorWithAlpha:0.5];
    [slider addTarget:self action:@selector(showAnimation:) forControlEvents:UIControlEventValueChanged];
    slider.continuous = NO;
    slider.showLogoView = YES;
    
    [self.view addSubview:slider];
    
//    [slider properties];
//    NSLog(@"%@", slider.allTargets);
    
}

- (void)showAnimation:(UISlider *)slider {
    
//    NSLog(@"%f",slider.value);
    
}



@end
