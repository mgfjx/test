//
//  ToViewController.h
//  Unity
//
//  Created by mgfjx on 2016/12/13.
//  Copyright © 2016年 XXL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToViewControllerDelegate <NSObject>

- (void)presentedOneControllerPressedDissmiss;
- (id<UIViewControllerInteractiveTransitioning>)interactiveTransitionForPresent;

@end

@interface ToViewController : UIViewController<UINavigationControllerDelegate>

@property (nonatomic, weak) id<ToViewControllerDelegate> delegate;

@end
