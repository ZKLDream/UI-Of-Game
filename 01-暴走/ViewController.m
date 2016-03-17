//
//  ViewController.m
//  01-暴走
//
//  Created by 千锋 on 16/2/18.
//  Copyright © 2016年 千锋. All rights reserved.
//

#import "ViewController.h"
#import "ZKLPersonView.h"
//屏宽
#define ScreenW [UIScreen mainScreen].bounds.size.width
//屏高
#define ScreenH [UIScreen mainScreen].bounds.size.height

@interface ViewController (){
    //创建一个人
    ZKLPersonView *_person;
    NSTimer *_timer;
    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.搭界面
    [self creatUI];
    //2.启动定时器
    _timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(gameLoop) userInfo:nil repeats:YES];
}

#pragma mark -gameLoop
-(void)gameLoop{
    _person.speed=3;
 
    if (_person.isMoving) {
        CGRect rect=_person.frame;
        switch (_person.direction) {
            case Left:
                rect.origin.x-=_person.speed;
                break;
            case Right:
                rect.origin.x+=_person.speed;
                break;
            case Up:
                rect.origin.y-=_person.speed;
                break;
            case Down:
                rect.origin.y+=_person.speed;
                break;
                
            default:
                break;
        }
        _person.frame=rect;
  
    }
  
}
#pragma mark -创建界面
-(void)creatUI{
    
    //=========背景=======
    UIImageView *background=[[UIImageView alloc]initWithFrame:self.view.bounds];
    [background setImage:[UIImage imageNamed:@"map"]];
    
    [self.view addSubview:background];
    
    //==========放人==========
    _person=[[ZKLPersonView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    _person.center=CGPointMake(ScreenW/2.0f, 100);
    //设置图片
    _person.image=[UIImage imageNamed:@"player_down_1"];
    //将人放在草地上
    [self.view addSubview:_person];
    //默认是不动的
    _person.isMoving=NO;
    
    //========方向按钮=======
    UIButton *upButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    upButton.center=CGPointMake(ScreenW/2.0f, ScreenH-200);
    //设置图片
    [upButton setImage:[UIImage imageNamed:@"button_up"] forState:UIControlStateNormal];
    //添加事件
    
    [upButton addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchDown];
    [upButton addTarget:self action:@selector(endMove:) forControlEvents:UIControlEventTouchUpInside];
    //显示在界面上
    [self.view addSubview:upButton];
    
    
    UIButton *downButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    downButton.center=CGPointMake(ScreenW/2.0f, ScreenH-100);
    //设置图片
    [downButton setImage:[UIImage imageNamed:@"button_down"] forState:UIControlStateNormal];
    //添加事件
    
    [downButton addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchDown];
    [downButton addTarget:self action:@selector(endMove:) forControlEvents:UIControlEventTouchUpInside];
    //显示在界面上
    [self.view addSubview:downButton];
    
    UIButton *leftButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    leftButton.center=CGPointMake(ScreenW/4.0f, ScreenH-150);
    //设置图片
    [leftButton setImage:[UIImage imageNamed:@"button_left"] forState:UIControlStateNormal];
    //添加事件
    
    [leftButton addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchDown];
    [leftButton addTarget:self action:@selector(endMove:) forControlEvents:UIControlEventTouchUpInside];
    //显示在界面上
    [self.view addSubview:leftButton];
    
    
    UIButton *rightButton=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 80)];
    rightButton.center=CGPointMake(ScreenW/4.0f*3, ScreenH-150);
    //设置图片
    [rightButton setImage:[UIImage imageNamed:@"button_right"] forState:UIControlStateNormal];
    //添加事件
    
    [rightButton addTarget:self action:@selector(startMove:) forControlEvents:UIControlEventTouchDown];
    [rightButton addTarget:self action:@selector(endMove:) forControlEvents:UIControlEventTouchUpInside];
    //显示在界面上
    [self.view addSubview:rightButton];
    upButton.tag=Up;
    downButton.tag=Down;
    leftButton.tag=Left;
    rightButton.tag=Right;
    
    
}
#pragma mark -按钮点击事件
-(void)startMove:(UIButton *)button{
    _person.isMoving=YES;
    [_person setDirection:button.tag];
    NSLog(@"开始移动");
    
    
    
    
    
    [_person startAnimating];
}

-(void)endMove:(UIButton *)button{
    _person.isMoving=NO;
    NSLog(@"停止移动");
    [_person stopAnimating];
    _person.image=_person.animationImages[0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
