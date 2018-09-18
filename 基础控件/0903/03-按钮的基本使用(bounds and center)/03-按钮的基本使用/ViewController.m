//
//  ViewController.m
//  03-按钮的基本使用
//
//  Created by 王元雄 on 2018/9/18.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)move:(UIButton *)btn;

- (IBAction)tranfFrom:(UIButton *)btn;

@property (nonatomic, weak) IBOutlet UIButton * head;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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
    CGPoint tempCenter = self.head.center;
    CGFloat delta = 10;
    switch (btn.tag) {
            
        case 10: // 上
            tempCenter.y -= delta;
            break;
            
        case 20: // 下
            tempCenter.y += delta;
            break;
            
        case 30: // 左
            tempCenter.x -= delta;
            break;
            
        case 40: // 右
            tempCenter.x += delta;
            break;
            
        default:
            break;
    }
    
    self.head.center = tempCenter;
    
}

#pragma mark - 放大缩小
- (IBAction)tranfFrom:(UIButton *)btn {
    
    CGRect tempBounds = self.head.bounds;
    CGFloat delta = 10;
    switch (btn.tag) {
            
        case 100:
            tempBounds.size.width += delta;
            tempBounds.size.height += delta;
            break;
            
        case 200:
            tempBounds.size.width -= delta;
            tempBounds.size.height -= delta;
            break;
            
        default:
            break;
    }
    
    self.head.bounds = tempBounds;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
