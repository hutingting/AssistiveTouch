//
//  ViewController.m
//  AssistiveTouch
//
//  Created by 胡廷廷 on 15/12/23.
//  Copyright © 2015年 hutingting. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<AssistiveTouchDelegate>

@end

@implementation ViewController{
    UIImageView *_imageView;
    UILabel *_lbTitle;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view setBackgroundColor:[UIColor grayColor]];
    
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    _imageView.image = [UIImage imageNamed:@"kf_00.png"];
    _imageView.alpha = 0.4;
    
    _lbTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 40, 40, 20)];
    [_lbTitle setText:@"客服"];
    [_lbTitle setTextAlignment:NSTextAlignmentCenter];
    _lbTitle.alpha = 0.4;
    
    _assistive = [[AssistiveTouch alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    [_assistive addView:_imageView];
    [_assistive addView:_lbTitle];
    _assistive.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

///
/**
 *  浮窗点击事件
 */
-(void)assistiveTocuhs{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://1008611"]];
}


@end
