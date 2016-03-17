//
//  ZKLPersonView.h
//  01-暴走
//
//  Created by 千锋 on 16/2/18.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import <UIKit/UIKit.h>

//方向枚举
typedef enum : NSUInteger {
    Left=1,
    Right,
    Up,
    Down,
} PersonDirection;

@interface ZKLPersonView : UIImageView

//是否在移动
@property (nonatomic,assign)BOOL isMoving;

//移动方向
//使用方向类型创建一个方向属性(方向的值是 Left/ Right/Up/ Down)
@property (nonatomic,assign) PersonDirection direction;

//人的移动速度
@property (nonatomic,assign) int speed;



@end
