//
//  ViewController.m
//  Calculator
//
//  Created by 侯琛 on 16/6/4.
//  Copyright © 2016年 HouChen. All rights reserved.
//

#import "ViewController.h"
#import "CodeWithXibViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self creatMakeUi];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)creatMakeUi{
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(50.0f, 170.0f, WIDTH(WINDOW)-100.0f, 40.0f);
    btn.layer.masksToBounds=YES;
    btn.layer.cornerRadius=4.0f;
    btn.layer.borderWidth=1.0f;
    btn.layer.borderColor=[UIColor cyanColor].CGColor;
    [btn setTitle:@"纯代码+Xib" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    
    
    UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame=CGRectMake(50.0f, 100.0f, WIDTH(WINDOW)-100.0f, 40.0f);
    btn1.layer.masksToBounds=YES;
    btn1.layer.cornerRadius=4.0f;
    btn1.layer.borderWidth=1.0f;
    btn1.layer.borderColor=[UIColor cyanColor].CGColor;
    [btn1 setTitle:@"ESC" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor cyanColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(action1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn1];
}
- (void)action:(id)sender{
    CodeWithXibViewController *codeWithXibViewController =[[CodeWithXibViewController alloc]init];
     [codeWithXibViewController.navigationItem setTitle:@"计算器"];
    [self.navigationController pushViewController:codeWithXibViewController animated:YES];
}
- (void)action1:(id)sender{
    exit(0);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
