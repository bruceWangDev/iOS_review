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
        
        // 初始化数据
        // File: 全路径 ..
        /*
         NSBundle:一个 NSBundle 代表一个文件夹
         利用 mainBundle 就可以访问手机里面的任何资源
         */
        
        NSBundle * bundle = [NSBundle mainBundle];
        
        // 获得 imageData.plist 的全路径
        NSString * path = [bundle pathForResource:@"ImageData" ofType:@"plist"];
        
        _imageData = [NSArray arrayWithContentsOfFile:path];
        
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
    self.numberLabel.text = [NSString stringWithFormat:@"%d/%ld",self.index + 1, self.imageData.count];
    
    // 2.取出 index 对应的字典数据
    NSDictionary * imageDict = self.imageData[self.index];
    
    self.iconView.image = [UIImage imageNamed:imageDict[kIconKey]];
    self.desLabel.text = imageDict[kDescKey];
    
    self.preBtn.enabled = (self.index != 0);
    
    self.nextBtn.enabled = (self.index != self.imageData.count - 1);
    
}

#pragma mark - 上一张
- (IBAction)previous {
    
    self.index--;
    
    [self changData];
    
}

#pragma mark - 下一张
- (IBAction)next {
    
    self.index++;
    
    [self changData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
