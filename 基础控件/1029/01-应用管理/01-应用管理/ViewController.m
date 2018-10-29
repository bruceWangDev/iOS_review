//
//  ViewController.m
//  01-应用管理
//
//  Created by 王元雄 on 2018/10/29.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"
#import "AppView.h"

@interface ViewController ()

/**
 存放应用信息
 */
@property (nonatomic, strong) NSArray * apps;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    // 添加应用信息
    
    /*
     双重 for 循环固然好用,但是如果不能被整除的话,最好的情况还是要一层 for 循环
     */
    
    [self creatUI1];
    
}

- (void)creatUI1 {
    
    
    // 总列数 (一行最多3项)
    int index = 9;
    int totalColumns = 3;
    
    // 计算间隙 = (屏幕的宽度 - 3 * 应用的宽度) / 4
    CGFloat appW = 120;
    CGFloat appH = 120;
    CGFloat margin = (self.view.bounds.size.width - totalColumns * appW) / (totalColumns + 1);
    CGFloat appX = margin;
    CGFloat appY = 50;
    
    // 行号
    int row = index / totalColumns;
    
    // 每一列的 x 一样 列号决定 x 值
    // 每一行的 y 一样 行号决定 y 值
    int count = 0;
    
    for (int i = 0 ; i < row; i++) {
        
        for (int j = 0; j < totalColumns; j++) {
            
            NSLog(@"i = %d j = %d // i + j = %d",i,j,i + j);
            
            // 应用信息
            NSDictionary * appInfo = self.apps[count];
//            NSLog(@"APPS INFO IS %@",appInfo);
            
            UIView * appV = [[UIView alloc] init];
            appV.backgroundColor = [UIColor whiteColor];
            appV.frame = CGRectMake(appX + (appW + appX) * j, appY + (appH + 10) * i, appW, appH);
//            appV.layer.masksToBounds = YES;
//            appV.layer.cornerRadius = 2.0f;
            appV.layer.borderWidth = 1.0f;
            appV.layer.borderColor = [UIColor orangeColor].CGColor;
            [self.view addSubview:appV];
            
            // 添加内部的小控件
            
            // 1.图片
            CGFloat iconW = 65;
            CGFloat iconH = 65;
            
            CGFloat iconX = (appW - iconW) / 2;
            CGFloat iconY = 0;
            
            UIImageView * imageV = [[UIImageView alloc] init];
            imageV.image = [UIImage imageNamed:appInfo[@"icon"]];
            imageV.backgroundColor = [UIColor whiteColor];
            imageV.frame = CGRectMake(iconX, iconY, iconW, iconH);
            [appV addSubview:imageV];
            
            // 2.文字
            CGFloat nameW = appW;
            CGFloat nameH = (appH - iconH) / 2;
            
            CGFloat nameX = 0;
            CGFloat nameY = iconY + iconH;
            
            UILabel * labelV = [[UILabel alloc] init];
            labelV.backgroundColor = [UIColor whiteColor];
            labelV.text = appInfo[@"name"];
            labelV.font = [UIFont systemFontOfSize:16.0f];
            labelV.textAlignment = NSTextAlignmentCenter;
            labelV.frame = CGRectMake(nameX, nameY, nameW, nameH);
            [appV addSubview:labelV];
            
            // 3.按钮
            CGFloat downW = appW;
            CGFloat downH = (appH - iconH) / 2;
            
            CGFloat downX = 0;
            CGFloat downY = nameY + nameH;
            
            UIButton * btn = [[UIButton alloc] init];
            
            /*
             
             */
//            [btn setImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
//            [btn setImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
            [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];

            [btn setTitle:@"下载" forState:UIControlStateNormal]; // 综合 Normal and Highlighted
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
            
            btn.frame = CGRectMake(downX, downY, downW, downH);
            [appV addSubview:btn];
            
            count++;
            
        }
        
    }
    
}

// 懒加载 - 这是一个知识点 ...
- (NSArray *)apps {
    
    if (_apps == nil) {
        
        // 获得 plist 全路径
        NSString * path = [[NSBundle mainBundle] pathForResource:@"app.plist" ofType:nil];
        
        // 加载数组
        _apps = [NSArray arrayWithContentsOfFile:path];
        
    }
    
//    NSLog(@"apps is %@",_apps);
    
    return _apps;
    
}


@end
