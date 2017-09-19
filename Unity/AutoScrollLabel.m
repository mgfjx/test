//
//  AutoScrollLabel.m
//  Education
//
//  Created by mgfjx on 2017/2/21.
//  Copyright © 2017年 Education. All rights reserved.
//

#import "AutoScrollLabel.h"

@interface AutoScrollLabel (){
    UILabel *marqueeLabel;
    CGPoint firstPoint;
}

@end

@implementation AutoScrollLabel

- (void)didMoveToSuperview {
    if (!self.superview) {
        return;
    }
    
    // 初始化数据
    marqueeLabel = [[UILabel alloc] init];
    marqueeLabel.backgroundColor = [UIColor clearColor];
    [self addSubview:marqueeLabel];
    self.clipsToBounds = YES;
    
    [self marquee];
}

- (void)marquee{
    if (!self.text) return;
    
    UILabel *label = marqueeLabel;
    
    CGFloat txtWidth = [self.text boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName: self.font} context:nil].size.width;
    txtWidth = ceilf(txtWidth);
    
    BOOL showAnimation = NO;
    if (txtWidth < self.width) {
        showAnimation = NO;
        txtWidth = self.width;
        label.textAlignment = self.textAlignment;
    }else{
        showAnimation = YES;
    }
    
    label.frame = CGRectMake(0, 0, txtWidth, self.height);
    label.tag = 1001;
    label.font = self.font;
    label.textColor = self.textColor;
    label.text = self.text;
    
    if (showAnimation) {
        [self startAnimation];
    }
    
}

- (void)startAnimation {
    
    CGFloat txtWidth = marqueeLabel.frame.size.width + marqueeLabel.frame.origin.x;
    
    CFTimeInterval changeWidth = txtWidth - self.width;
    CFTimeInterval speed = changeWidth > 30 ? 10.0 : 5.0;
    CFTimeInterval duration = changeWidth/speed;
    
    CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    moveAnimation.duration = duration + 1;
    moveAnimation.keyTimes = @[@(1.0/duration),@0.9,@1.0];
    moveAnimation.values = @[@0,@(-txtWidth+self.width),@(-txtWidth+self.width)];
    moveAnimation.repeatCount = MAXFLOAT;
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:@"linear"];
    [marqueeLabel.layer addAnimation:moveAnimation forKey:@"move"];
}

@end
