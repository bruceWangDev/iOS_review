//
//  ViewController.m
//  03-按钮的基本使用
//
//  Created by 王元雄 on 2018/9/18.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)moveAngBig;

- (IBAction)move:(UIButton *)btn;

- (IBAction)tranfFrom:(UIButton *)btn;

@property (nonatomic, weak) IBOutlet UIButton * head;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)moveAngBig {
    
    // 1、开启动画
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    // 2、修改属性
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.y += 50;
    tempFrame.origin.x += 50;

    tempFrame.size.width += 50;
    tempFrame.size.height += 50;
    
    self.head.frame = tempFrame;
    
    // 3、提交动画
    [UIView commitAnimations];
    
}

#pragma mark - 移动（上下左右）
- (IBAction)move:(UIButton *)btn {
    /*
     当被点击的方法只有一个参数时，会默认把那个按钮传递过来
     */
    
//    NSLog(@"hello world - %@",btn);
    
    /*
     1、取出原来的属性
     2、修改临时属性
     3、重新赋值
     */
    CGRect tempFrame = self.head.frame;
    CGFloat delta = 10;
    switch (btn.tag) {
            
        case 10: // 上
            tempFrame.origin.y -= delta;
            break;
            
        case 20: // 下
            tempFrame.origin.y += delta;
            break;
            
        case 30: // 左
            tempFrame.origin.x -= delta;
            break;
            
        case 40: // 右
            tempFrame.origin.x += delta;
            break;
            
        default:
            break;
    }
    
    self.head.frame = tempFrame;
    
}

#pragma mark - 放大缩小
- (IBAction)tranfFrom:(UIButton *)btn {
    
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    
    CGRect tempFrame = self.head.frame;
    CGFloat delta = 10;
    switch (btn.tag) {
            
        case 100:
            tempFrame.size.width += delta;
            tempFrame.size.height += delta;
            break;
            
        case 200:
            tempFrame.size.width -= delta;
            tempFrame.size.height -= delta;
            break;
            
        default:
            break;
    }
    
    self.head.frame = tempFrame;
    
    [UIView commitAnimations];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
