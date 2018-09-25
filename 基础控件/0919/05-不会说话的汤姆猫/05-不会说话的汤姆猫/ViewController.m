//
//  ViewController.m
//  05-不会说话的汤姆猫
//
//  Created by 王元雄 on 2018/9/25.
//  Copyright © 2018年 a developer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *tom;

- (IBAction)drink;
- (IBAction)knock;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

/**
 播放动画
 */
- (void)runAnimationWithCount:(int)count name:(NSString *)name {
    
    if (self.tom.isAnimating) {
        return;
    }
    
    // 加载所有动画图片
    NSMutableArray * images = [NSMutableArray array];
    
    for (int i = 0; i < count; i++) {
        
        /*
         加载图片 - imageNamed: 缓存 快 但是占用内存大 容易 crash
         imageNamed: 有缓存
         imageWithContentsOfFile: 传入文件全路径 没有缓存
         */
//        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_%02d", name, i]];
        
        NSString * filename = [NSString stringWithFormat:@"%@_%02d.jpg", name, i];
        NSLog(@"filename is %@",filename);
        NSBundle * bundle = [NSBundle mainBundle];
        NSString * path = [bundle pathForResource:filename ofType:nil];
        UIImage * image = [UIImage imageWithContentsOfFile:path];
        
        [images addObject:image];
    }
    
    self.tom.animationImages = images;
    // 设置播放次数
    self.tom.animationRepeatCount = 1;
    // 设置播放时间
    self.tom.animationDuration = images.count * 0.06;
    
    [self.tom startAnimating];
    
    CGFloat delta = self.tom.animationDuration + 1.0;
    
    // 定时器 - 动画播放完1秒后清除内存
//    [self performSelector:@selector(clearCaches) withObject:nil afterDelay:delta];
    [self.tom performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:delta]; // 机智
}

//- (void)clearCaches {
//
//    NSLog(@"++++____");
//    self.tom.animationImages = nil;
//
//}

- (IBAction)drink {
    
    [self runAnimationWithCount:81 name:@"drink"];
    
}

- (IBAction)knock {

    [self runAnimationWithCount:81 name:@"knockout"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
