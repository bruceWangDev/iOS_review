//
//  ViewController.m
//  04-图片浏览器
//
//  Created by 王元雄 on 2018/9/19.
//  Copyright © 2018年 a developer. All rights reserved.
//

/*
 strong 用于一般对象
 weak   用于 UI 控件
 */

#define kIconKey @"icon"
#define kDescKey @"desc"

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

// 数据集合
@property (nonatomic, strong) NSArray * imageData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self changData];

}

- (NSArray *)imageData {
    
    if (_imageData == nil) { // 意味着从未初始化过
        
        // 初始化数据 - NSArray * dataArr = @[@{},@{},@{},@{},@{}];
        // 延迟加载 - 用到的时候再去加载
        // 将属性放在 get 方法中去加载
        NSMutableDictionary * image1 = [NSMutableDictionary dictionary];
        image1[kIconKey] = @"biaoqingdi";
        image1[kDescKey] = @"001";
        
        NSMutableDictionary * image2 = [NSMutableDictionary dictionary];
        image2[kIconKey] = @"wangba";
        image2[kDescKey] = @"002";
        
        NSMutableDictionary * image3 = [NSMutableDictionary dictionary];
        image3[kIconKey] = @"bingli";
        image3[kDescKey] = @"003";
        
        NSMutableDictionary * image4 = [NSMutableDictionary dictionary];
        image4[kIconKey] = @"chiniupa";
        image4[kDescKey] = @"004";
        
        NSMutableDictionary * image5 = [NSMutableDictionary dictionary];
        image5[kIconKey] = @"danteng";
        image5[kDescKey] = @"005";
        
        _imageData = @[image1,image2,image3,image4,image5];
        
    }
    
    return _imageData;
    
}

#pragma mark - 改变数据
- (void)changData {
    
    /*
     扩展性
     
     码奴
     码农
     */
    
    // 1.改变数据
    _numberLabel.text = [NSString stringWithFormat:@"%d/%ld",_index + 1, self.imageData.count];
    
    // 2.取出 index 对应的字典数据
    NSDictionary * imageDict = self.imageData[_index];
    
    _iconView.image = [UIImage imageNamed:imageDict[kIconKey]];
    _desLabel.text = imageDict[kDescKey];
    
    _preBtn.enabled = (_index != 0);
    
    _nextBtn.enabled = (_index != self.imageData.count - 1);
    
}

#pragma mark - 上一张
- (IBAction)previous {
    
    _index--;
    
    [self changData];
    
}

#pragma mark - 下一张
- (IBAction)next {
    
    _index++;
    
    [self changData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
