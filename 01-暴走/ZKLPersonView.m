//
//  ZKLPersonView.m
//  01-暴走
//
//  Created by 千锋 on 16/2/18.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ZKLPersonView.h"

@implementation ZKLPersonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setDirection:(PersonDirection)direction{
    
    //重写set方法的时候，不要忘记这个方法的本质
    _direction=direction;
    //重写direction属性的set方法
    
    //写其他的操作
    switch (direction) {
        case Left:
        { NSMutableArray * LeftArray=[[NSMutableArray alloc]init];
            for (int i=1; i<4; i++) {
                UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"player_left_%d",i]];
                [LeftArray addObject:image];
            }
            self.animationImages=LeftArray;
            
            
        }  break;
        case Right:
        { NSMutableArray * LeftArray=[[NSMutableArray alloc]init];
            for (int i=1; i<4; i++) {
                UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"player_right_%d",i]];
                [LeftArray addObject:image];
            }
            self.animationImages=LeftArray;
            
            
        }  break;
            
        case Up:
        { NSMutableArray * LeftArray=[[NSMutableArray alloc]init];
            for (int i=1; i<4; i++) {
                UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"player_up_%d",i]];
                [LeftArray addObject:image];
            }
            self.animationImages=LeftArray;
        }
            break;
        case Down:
            { NSMutableArray * LeftArray=[[NSMutableArray alloc]init];
                for (int i=1; i<4; i++) {
                    UIImage * image=[UIImage imageNamed:[NSString stringWithFormat:@"player_down_%d",i]];
                    [LeftArray addObject:image];
                }
                self.animationImages=LeftArray;
                
                
            }  break;
            
    }
    
}


@end
