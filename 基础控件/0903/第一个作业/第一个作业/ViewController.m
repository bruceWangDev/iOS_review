//
//  ViewController.m
//  第一个作业
//
//  Created by 王元雄 on 2018/9/17.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *qq;
@property (weak, nonatomic) IBOutlet UITextField *passWord;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)login:(id)sender {
    
    NSLog(@"您输入的用户名是:%@ and 您输入的密码是:%@",self.qq.text,self.passWord.text);
    [self.view endEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
