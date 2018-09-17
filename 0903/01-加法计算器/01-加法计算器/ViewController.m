//
//  ViewController.m
//  01-加法计算器
//
//  Created by 王元雄 on 2018/9/3.
//  Copyright © 2018年 a developer. All rights reserved.
//

/*
 IBAction:
 1.能保证方法可以连线
 2.相当于void
 
 IBOutlet:
 1.能保证属性可以连线
 */

#import "ViewController.h"

// 类扩展（私有扩展）
@interface ViewController ()

// 属性想要连线必须在类名之前 add IBOutlet
@property (nonatomic, weak) IBOutlet UITextField * num1;
@property (nonatomic, weak) IBOutlet UITextField * num2;
@property (nonatomic, weak) IBOutlet UILabel * sumLabel;

// 点击了计算按钮的时候就调用 想连线 method 的返回值必须是 IBAction
// 连线默认是 Touch Up Inside
- (IBAction)compute;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 做 任何的 附加的 设置 在 装载视图 之后，形式 是 nib

}

- (void)compute {
    
//    NSLog(@"点击了计算按钮");
    
    // 1、取得两个文本框的值
    NSString * text1 = self.num1.text;
    NSString * text2 = self.num2.text;
    
    // 2、相加
    int sum = text1.intValue + text2.intValue;
    
    // 3、将结果显示到最右边的标签上
    self.sumLabel.text = [NSString stringWithFormat:@"%d",sum];
    
    // 4、让键盘退出 ..
    
    /*
     响应者
     第一响应者：叫出键盘的那个控件
     */
    
    // 不当第一响应者（就会把键盘退下） 谁把键盘叫出来 谁把键盘收回去
//    [self.num1 resignFirstResponder];
//    [self.num2 resignFirstResponder];
    
    // endEditing 结束编辑
    [self.view endEditing:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    // 处理任何可以重新创建的资源 .. 
}

@end
