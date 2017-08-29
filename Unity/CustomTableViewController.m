//
//  CustomTableViewController.m
//  Unity
//
//  Created by mgfjx on 2017/4/7.
//  Copyright © 2017年 XXL. All rights reserved.
//

#import "CustomTableViewController.h"
#import "UIImageView+Scale.h"

@interface CustomTableViewController ()

@end

@implementation CustomTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:nil];
    imgView.frame = CGRectMake(0, 0, self.view.width, 300);
    imgView.backgroundColor = [UIColor redColor];
    imgView.userInteractionEnabled = YES;
    imgView.image = [UIImage imageNamed:@"5.jpg"];
    imgView.enableScale = YES;
    [cell.contentView addSubview:imgView];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
