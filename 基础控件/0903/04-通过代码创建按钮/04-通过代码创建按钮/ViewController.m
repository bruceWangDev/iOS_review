//
//  ViewController.m
//  04-通过代码创建按钮
//
//  Created by 王元雄 on 2018/9/18.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - VC的view加载完毕的时候调用
/*
 一般在这里进行界面的初始化
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidload");
    
    // 添加
    
    // 1、创建按钮
    UIButton * btn = [[UIButton alloc] init];
    
    // 2、添加按钮
    [self.view addSubview:btn];
    
    // 3、设置frame
    btn.frame = CGRectMake(100, 100, 100, 100);
    
    // 4、设置背景色
    btn.backgroundColor = [UIColor redColor];
    
    [btn setTitle:@"hello world" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    
    [btn setTitle:@"say byebye" forState:UIControlStateHighlighted];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    [btn setImage:[UIImage imageNamed:@"btn_01"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"btn_02"] forState:UIControlStateHighlighted];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
