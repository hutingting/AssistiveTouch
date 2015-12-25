//
//  AssistiveTouch.h
//  Elderly_langlang
//
//  Created by 胡廷廷 on 15/12/22.
//  Copyright © 2015年 langlangit. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AssistiveTouchDelegate;
@interface AssistiveTouch : UIWindow
@property(nonatomic,strong)UIViewController *myControl;
@property(nonatomic,unsafe_unretained)id<AssistiveTouchDelegate> delegate;

/**
 *  添加视图
 *
 *  @param views
 */
-(void)addView:(UIView *) views;

/**
 *  设置点击前的透明度
 *
 *  @param alpha
 */
-(void)setTouchBeginAlpha:(float) alpha;
@end

@protocol AssistiveTouchDelegate <NSObject>
@optional
//悬浮窗点击事件
-(void)assistiveTocuhs;
@end