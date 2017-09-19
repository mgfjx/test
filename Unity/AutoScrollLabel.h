//
//  AutoScrollLabel.h
//  Education
//
//  Created by mgfjx on 2017/2/21.
//  Copyright © 2017年 Education. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AutoScrollLabel : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, assign) NSInteger rate;
@property (nonatomic, assign) NSTextAlignment textAlignment;

@end
