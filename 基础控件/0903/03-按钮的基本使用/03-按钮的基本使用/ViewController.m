//
//  ViewController.m
//  03-按钮的基本使用
//
//  Created by 王元雄 on 2018/9/18.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)up;

- (IBAction)down;

- (IBAction)left;

- (IBAction)right;

- (IBAction)big;

- (IBAction)small;

@property (nonatomic, weak) IBOutlet UIButton * head;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark - 向上走
- (IBAction)up {
    
    /*
     不允许直接修改对象的结构体属性的成员 ..
     self.head.frame.origin.y = self.head.frame.origin.y - 10;
     
     但是允许直接修改对象的结构体属性
     */
    CGRect tempFrame = self.head.frame;
//    tempFrame.origin.y = tempFrame.origin.y - 10;
    tempFrame.origin.y -= 10;
    self.head.frame = tempFrame;
    
}

#pragma mark - 向下走
- (IBAction)down {
    
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.y += 10;
    self.head.frame = tempFrame;
    
}

#pragma mark - 向左走
- (IBAction)left {
    
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.x -= 10;
    self.head.frame = tempFrame;
    
}

#pragma mark - 向右走
- (IBAction)right {
    
    CGRect tempFrame = self.head.frame;
    tempFrame.origin.x += 10;
    self.head.frame = tempFrame;
    
}

#pragma mark - 放大
- (IBAction)big {
    
    /*
     1、取出原来的属性
     2、改变临时属性
     3、用临时属性覆盖原来的属性
     */
    CGRect tempFrame = self.head.frame;
    tempFrame.size.width += 10;
    tempFrame.size.height += 10;
    self.head.frame = tempFrame;
    
    NSLog(@"%@",NSStringFromCGRect(self.head.frame));
    
}

#pragma mark - 缩小
- (IBAction)small {
    
    CGRect tempFrame = self.head.frame;
    tempFrame.size.width -= 10;
    tempFrame.size.height -= 10;
    self.head.frame = tempFrame;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
