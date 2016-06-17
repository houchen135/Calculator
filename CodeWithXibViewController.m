//
//  CodeWithXibViewController.m
//  Calculator
//
//  Created by 侯琛 on 16/6/4.
//  Copyright © 2016年 HouChen. All rights reserved.
//

#import "CodeWithXibViewController.h"
#import "CalculatorView.h"
#import "CalculatorComputationalLogic.h"
@interface CodeWithXibViewController ()
@property (nonatomic,strong)CalculatorView *calculatorView;

@end

@implementation CodeWithXibViewController
- (CalculatorView *)calculatorView
{
    if (!_calculatorView) {
        _calculatorView =[[[NSBundle mainBundle]loadNibNamed:@"CalculatorView" owner:self options:nil]firstObject];
        _calculatorView.frame=CGRectMake(0, 64, WIDTH(WINDOW), HEIGHT(WINDOW)-64);
    }
    return _calculatorView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self creatMakeUi];
    // Do any additional setup after loading the view.
}
- (void)creatMakeUi{
    [self.view addSubview:self.calculatorView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
