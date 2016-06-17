//
//  CalculatorView.m
//  Calculator
//
//  Created by 侯琛 on 16/6/4.
//  Copyright © 2016年 HouChen. All rights reserved.
//

#import "CalculatorView.h"
#import "CalculatorComputationalLogic.h"

@interface CalculatorView()
@property BOOL isUseInEnteringANumber;
@property (nonatomic,strong)CalculatorComputationalLogic *brain;
@property BOOL isContinue;
@property BOOL secondEqual;
@property BOOL firstEqual;
@end
@implementation CalculatorView
-(CalculatorComputationalLogic *)brain
{
    if (!_brain) {
        _brain =[[CalculatorComputationalLogic alloc]init];
    }
    return _brain;
}
- (IBAction)numBtnAction:(UIButton *)sender {
    _secondEqual = NO;
    NSString *digit = sender.currentTitle;
    if (_isUseInEnteringANumber){
        if ([digit isEqualToString:@"."]) {
            NSArray *b = [self.result.text componentsSeparatedByString:@"."];
            if (b.count < 2) {
               self.result.text = [self.result.text stringByAppendingString:digit];
            }
        }else{
            if ([self.result.text isEqualToString:@"0"]) {
                self.result.text = digit;
            }else{
                self.result.text = [self.result.text stringByAppendingString:digit];
            }
        }
    }else {
        self.result.text = digit;
        _isUseInEnteringANumber = YES;
    }
}
- (IBAction)operationBtnAction:(UIButton *)sender {
    self.firstEqual = YES;
    _secondEqual = NO;
    if(_isContinue) [self operationResultBtnAction];
    [self.brain pushOperation:sender.currentTitle];
    
    [self numberInBrain];
    _isContinue = YES;
}

- (IBAction)operationResultBtnAction {
    if (self.firstEqual) {
        
        
        _isContinue = NO;
        [self numberInBrain];
        double resultNumber = [self.brain result:_secondEqual];
        NSMutableString *resultStr = [NSMutableString stringWithFormat:@"%lg",resultNumber];
        if(resultNumber>1000000000){
            
            int count = 0;
            while (resultNumber >=10) {
                resultNumber/= 10;
                count++;
            }
            [resultStr deleteCharactersInRange:NSMakeRange(0, [resultStr length])];
            [resultStr appendFormat:@"%lg",resultNumber];
            [resultStr appendFormat:@" E%d",count];
            
        }
        self.result.text = resultStr;
        [resultStr deleteCharactersInRange:NSMakeRange(0, [resultStr length])];
        _secondEqual = YES;
    }else {
        double resultNumber = [self.result.text doubleValue];
        NSMutableString *resultStr = [NSMutableString stringWithFormat:@"%lg",resultNumber];
        if(resultNumber>1000000000){
            
            double count = 0.0;
            while (resultNumber >=10) {
                resultNumber /= 10.0;
                count += 1.0;
            }
            [resultStr deleteCharactersInRange:NSMakeRange(0, [resultStr length])];
            [resultStr appendFormat:@"%lg",resultNumber];
            [resultStr appendFormat:@"e%g",count];
            
        }
        self.result.text = resultStr;
        [resultStr deleteCharactersInRange:NSMakeRange(0, [resultStr length])];
    }
    self.firstEqual = YES;
    
}
- (void)numberInBrain
{
    _isUseInEnteringANumber = NO;
    
    
    [self.brain pushNumberInStack:[self.result.text doubleValue] andBool:self.secondEqual];
}
- (IBAction)empty:(id)sender {
    self.result.text = @"0";
    [self.brain zero];
    _isContinue = NO;
    _isUseInEnteringANumber = NO;
    
    [self.brain pushNumberInStack:0.0 andBool:NO];
    self.secondEqual = NO;
    self.firstEqual = NO;

}
- (IBAction)deleteOneNum:(id)sender {
    self.result.text =[self.result.text substringToIndex:self.result.text.length-1];
    if (self.result.text.length ==0) {
        self.result.text =@"0";
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
