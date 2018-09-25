//
//  ViewController.m
//  04-图片浏览器
//
//  Created by 王元雄 on 2018/9/19.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *desLabel;

@property (weak, nonatomic) IBOutlet UIButton *preBtn;

@property (weak, nonatomic) IBOutlet UIButton *nextBtn;

- (IBAction)previous;

- (IBAction)next;

// 记录当前显示的是第几张图片
@property (nonatomic, assign) int index; // 默认是 0

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /*
     步骤分析:
     1.搭建 UI 界面
     2.监听按钮点击
     3.切换序号
     */
    
//    _numberLabel.text = @"1/5";
//    _iconView.image = [UIImage imageNamed:@"biaoqingdi"];
//    _desLabel.text = @"001";
//    
//    _preBtn.enabled = NO;

//    _index = -1;
//
//    [self next];
    
    _index = 1;
    
    [self previous];
    
}

- (void)changData {
    
    // 2.根据索引显示对应的内容
    switch (_index) {
        case 0:
            _numberLabel.text = @"1/5";
            _iconView.image = [UIImage imageNamed:@"biaoqingdi"];
            _desLabel.text = @"001";
            break;
        case 1:
            _numberLabel.text = @"2/5";
            _iconView.image = [UIImage imageNamed:@"wangba"];
            _desLabel.text = @"002";
            break;
        case 2:
            _numberLabel.text = @"3/5";
            _iconView.image = [UIImage imageNamed:@"bingli"];
            _desLabel.text = @"003";
            break;
        case 3:
            _numberLabel.text = @"4/5";
            _iconView.image = [UIImage imageNamed:@"chiniupa"];
            _desLabel.text = @"004";
            break;
        case 4:
            _numberLabel.text = @"5/5";
            _iconView.image = [UIImage imageNamed:@"danteng"];
            _desLabel.text = @"005";
            break;
        default:
            break;
    }
    
    // 3.控制箭头按钮的状态
    /*
     if (_index == 0) {
     
     _preBtn.enabled = NO;
     
     } else {
     
     _preBtn.enabled = YES;
     
     }
     
     if (_index == 4) {
     
     _nextBtn.enabled = NO;
     
     } else {
     
     _nextBtn.enabled = YES;
     
     }
     */
    
//    _preBtn.enabled = (_index == 0) ? NO : YES;
    
    _preBtn.enabled = (_index != 0);
    
    _nextBtn.enabled = (_index != 4);
    
}

#pragma mark - 上一张
- (IBAction)previous {
    
    // 1.减少索引
    _index--; // 这也是 get 方法
    NSLog(@"%d",_index);
    
    [self changData];
    
}

#pragma mark - 下一张
- (IBAction)next {
    
    // 1.增加索引
    _index++;
    NSLog(@"%d",_index);
    
    [self changData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
