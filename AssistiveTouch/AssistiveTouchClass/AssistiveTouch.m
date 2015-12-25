//
//  AssistiveTouch.m
//  Elderly_langlang
//
//  Created by 胡廷廷 on 15/12/22.
//  Copyright © 2015年 langlangit. All rights reserved.
//

#import "AssistiveTouch.h"
#define kWIDTH self.frame.size.width
#define kHEIGHT self.frame.size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
@interface AssistiveTouch ()
@property(nonatomic,assign)float alphas;
@end

@implementation AssistiveTouch

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.windowLevel = UIWindowLevelAlert;
        _myControl = [[UIViewController alloc] init];
        self.rootViewController = _myControl;
        [self makeKeyAndVisible];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [_myControl.view addGestureRecognizer:pan];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickTouch:)];
        [_myControl.view addGestureRecognizer:tap];
        _alphas = 0.4;
        _myControl.view.alpha = _alphas;
    }
    return self;
}

//添加视图
-(void)addView:(UIView *) views{
     [_myControl.view addSubview:views];
}

//改变位置
-(void)locationChange:(UIPanGestureRecognizer*)p
{
    CGPoint panPoint = [p locationInView:[[UIApplication sharedApplication] keyWindow]];
    
    if(p.state == UIGestureRecognizerStateBegan)
    {
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(changeColor) object:nil];
        _myControl.view.alpha = 1.0;
    }
    else if (p.state == UIGestureRecognizerStateEnded)
    {
        [self performSelector:@selector(changeColor) withObject:nil afterDelay:4.0];
    }
    if(p.state == UIGestureRecognizerStateChanged)
    {
        self.center = CGPointMake(panPoint.x, panPoint.y);
    }
    else if(p.state == UIGestureRecognizerStateEnded)
    {
        if(panPoint.x <= kScreenWidth/2)
        {
            if(panPoint.y <= 40+kHEIGHT/2 && panPoint.x >= 20+kWIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, kHEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-kHEIGHT/2-40 && panPoint.x >= 20+kWIDTH/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, kScreenHeight-kHEIGHT/2);
                }];
            }
            else if (panPoint.x < kWIDTH/2+15 && panPoint.y > kScreenHeight-kHEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(kWIDTH/2, kScreenHeight-kHEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y < kHEIGHT/2 ? kHEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(kWIDTH/2, pointy);
                }];
            }
        }
        else if(panPoint.x > kScreenWidth/2)
        {
            if(panPoint.y <= 40+kHEIGHT/2 && panPoint.x < kScreenWidth-kWIDTH/2-20 )
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, kHEIGHT/2);
                }];
            }
            else if(panPoint.y >= kScreenHeight-40-kHEIGHT/2 && panPoint.x < kScreenWidth-kWIDTH/2-20)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(panPoint.x, kScreenHeight-kHEIGHT/2);
                }];
            }
            else if (panPoint.x > kScreenWidth-kWIDTH/2-15 && panPoint.y < kHEIGHT/2)
            {
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(kScreenWidth-kWIDTH/2, kHEIGHT/2);
                }];
            }
            else
            {
                CGFloat pointy = panPoint.y > kScreenHeight-kHEIGHT/2 ? kScreenHeight-kHEIGHT/2 :panPoint.y;
                [UIView animateWithDuration:0.2 animations:^{
                    self.center = CGPointMake(kScreenWidth-kWIDTH/2, pointy);
                }];
            }
        }
    }
}

//点击事件
-(void)clickTouch:(UITapGestureRecognizer*)t
{
    _myControl.view.alpha = 1.0;
    [self performSelector:@selector(changeColor) withObject:nil afterDelay:4.0];
    if(_delegate && [_delegate respondsToSelector:@selector(assistiveTocuhs)])
    {
        [_delegate assistiveTocuhs];
    }
}

//颜色改变
-(void)changeColor
{
    [UIView animateWithDuration:2.0 animations:^{
        _myControl.view.alpha = _alphas;
    }];
}

//透明度
-(void)setTouchBeginAlpha:(float) alpha{
    _alphas = alpha;
    _myControl.view.alpha = alpha;
}

@end
