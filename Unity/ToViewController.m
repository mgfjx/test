//
//  ToViewController.m
//  Unity
//
//  Created by mgfjx on 2016/12/13.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import "ToViewController.h"

@interface ToViewController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) InteractiveTransition *pushTransiition;
@property (nonatomic, strong) InteractiveTransition *popTransiition;

@end

@implementation ToViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.tag = 100;
    
    self.navigationController.delegate = self;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = [UIColor randomColorWithAlpha:0.5];
    
    [self.view addSubview:btn];
    
    self.popTransiition = [InteractiveTransition interactiveTransitionWithTransitionType:TransitionTypePop GestureDirection:TransitionGestureDirectionRight];
    [self.popTransiition addPanGestureForViewController:self];
    
}

- (void)btnClicked{
//    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UIViewControllerTransitioningDelegate 
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return [TransitionManager transitionWithTransitionType:TransitionTypePresent forController:nil];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return [TransitionManager transitionWithTransitionType:TransitionTypeDismiss forController:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator{
    InteractiveTransition *interactivePresent = [_delegate interactiveTransitionForPresent];
    return interactivePresent.isInteractionBegin ? interactivePresent : nil;
}

#pragma mark - UINavigationControllerDelegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    return [TransitionManager transitionWithTransitionType:operation == UINavigationControllerOperationPush ? TransitionTypePush : TransitionTypePop forController:nil];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    return _popTransiition.isInteractionBegin ? _popTransiition : nil;
}

@end
