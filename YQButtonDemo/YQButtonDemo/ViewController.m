//
//  ViewController.m
//  YQButtonDemo
//
//  Created by 杨清 on 2018/8/7.
//  Copyright © 2018年 QuinceyYang. All rights reserved.
//

#import "ViewController.h"
#import "YQButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    //图片在标题上方
    YQButton *btn1 = [[YQButton alloc] initWithFrame:CGRectMake(20, 90, 100, 70) imageAtTop:3 space:2];
    btn1.layer.borderWidth = 0.67;
    btn1.layer.borderColor = UIColor.grayColor.CGColor;
    [btn1 setImage:[UIImage imageNamed:@"icon_photo"] forState:UIControlStateNormal];
    [btn1 setTitle:@"title text" forState:UIControlStateNormal];
    [btn1 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    btn1.tapAction = ^(YQButton *sender) {
        NSLog(@"button be tapped !!!");
    };
    [self.view addSubview:btn1];
    
    //图片在标题下方
    YQButton *btn2 = [[YQButton alloc] initWithFrame:CGRectMake(135, 90, 100, 70) imageAtBottom:3 space:4];
    btn2.layer.borderWidth = 0.67;
    btn2.layer.borderColor = UIColor.grayColor.CGColor;
    [btn2 setImage:[UIImage imageNamed:@"icon_photo"] forState:UIControlStateNormal];
    [btn2 setTitle:@"title text" forState:UIControlStateNormal];
    [btn2 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:btn2];
    
    //图片在左边，标题自适应
    YQButton *btn3 = [[YQButton alloc] initWithFrame:CGRectMake(20, 175, 200, 50) imageAtLeft:3 space:4];
    btn3.layer.borderWidth = 0.67;
    btn3.layer.borderColor = UIColor.grayColor.CGColor;
    [btn3 setImage:[UIImage imageNamed:@"icon_photo"] forState:UIControlStateNormal];
    [btn3 setTitle:@"title text" forState:UIControlStateNormal];
    [btn3 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:btn3];

    //图片在右边，标题自适应，且标题靠近图片
    YQButton *btn4 = [[YQButton alloc] initWithFrame:CGRectMake(20, 240, 200, 50) imageAtRight:3 space:4];
    btn4.layer.borderWidth = 0.67;
    btn4.layer.borderColor = UIColor.grayColor.CGColor;
    [btn4 setImage:[UIImage imageNamed:@"icon_photo"] forState:UIControlStateNormal];
    [btn4 setTitle:@"title text" forState:UIControlStateNormal];
    [btn4 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:btn4];

    //自定义图片和标题位置
    YQButton *btn5 = [[YQButton alloc] initWithFrame:CGRectMake(20, 305, 100, 70) imageFrame:CGRectMake(25, 14, 40, 41) titleFrame:CGRectMake(15, 30, 70, 21)];
    btn5.layer.borderWidth = 0.67;
    btn5.layer.borderColor = UIColor.grayColor.CGColor;
    [btn5 setImage:[UIImage imageNamed:@"icon_photo"] forState:UIControlStateNormal];
    [btn5 setTitle:@"title text" forState:UIControlStateNormal];
    [btn5 setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    [self.view addSubview:btn5];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
