//
//  ViewController.m
//  03-transform
//
//  Created by 王元雄 on 2018/9/19.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) CGFloat ty;

- (IBAction)leftRotate;

- (IBAction)big;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)up {
    
    // 1.取得头像按钮
    /*
     viewWithTag:
     拿取控制器里面的子控件 一层一层去挖掘 只要是子控件 ..
     如果 tag 一样,按照添加顺序去查找
     */
    UIButton * btn = (UIButton *)[self.view viewWithTag:10];
//    NSLog(@"%@",btn);
    
//    CGRect tempFrame = btn.frame;
//    tempFrame.origin.y -= 20;
//    btn.frame = tempFrame;
    
    /*
     2.
     CGAffineTransformMakeTranslation(x,y)
     参数是 需要 偏移的量
     
     transfrom 形变属性
     transfrom 是相对于初始状态去操作的
     
     CGAffineTransformTranslate(初始transfrom,x,y)
     第一个参数是当前的 transfrom - 等价有一个参照
     */

//    _ty -= 20;
//    btn.transform = CGAffineTransformMakeTranslation(0, _ty);
    // 2.每次向上移动100的距离
    btn.transform = CGAffineTransformTranslate(btn.transform, 0, -20);
    
}

- (IBAction)leftRotate {
    
    // 1.取得头像按钮
    UIButton * head = (UIButton *)[self.view viewWithTag:10];
    //    head.transform = CGAffineTransformMakeRotation(-M_PI_4);
    
    // 2.向左旋转 45° 角度是正数,顺时针,角度是负数,逆时针
    head.transform = CGAffineTransformRotate(head.transform, -M_PI_4);
}

- (IBAction)big {
    
    UIButton * head = [self.view viewWithTag:10];
    
    // 增大 参数是缩放比例 长 宽 缩放比例 // 正数-放大 负数-缩小
//    head.transform = CGAffineTransformMakeScale(1.5, 1.5);
    head.transform = CGAffineTransformScale(head.transform, 1.5, 1.5);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
