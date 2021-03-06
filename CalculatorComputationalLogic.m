//
//  CalculatorComputationalLogic.m
//  Calculator
//
//  Created by 侯琛 on 16/6/4.
//  Copyright © 2016年 HouChen. All rights reserved.
//

#import "CalculatorComputationalLogic.h"
@interface CalculatorComputationalLogic()

@property (strong,nonatomic)NSMutableArray *operandStack;
@property (assign,nonatomic)unichar symbol;
@property (assign,nonatomic)double secondNumber;

@end
@implementation CalculatorComputationalLogic
- (NSMutableArray *)operandStack
{
    if (!_operandStack) {
        _operandStack = [NSMutableArray arrayWithCapacity:3];
    }
    return _operandStack;
}


- (double)outANumber
{
    
    double number = [[self.operandStack lastObject]doubleValue];
    if ([self.operandStack lastObject]){
        [self.operandStack removeLastObject];
    }
    
    return number;
    
    
}

- (double)result:(BOOL)secondEq
{
    NSString *opera = [NSString stringWithFormat:@"%c",self.symbol];
    if (!secondEq){
        if ([self.operandStack count] >1 ){
            double number2 = [self outANumber];
            double number1 = [self outANumber];
            
            double result = 0;
            if ([opera isEqualToString:@"+"]) result = number1 + number2;
            else if ([@"-" isEqualToString:opera]) result = number1 - number2;
            else if ([opera isEqualToString:@"*"]) result = number1 * number2;
            else if ([opera isEqualToString:@"/"]) result = number1 / number2;
            
            return result;}
        else {
            [self zero];
            return  0;
        }
    }else {
        
        double number = [self outANumber];
        
        
        double result  = 0;
        if ([opera isEqualToString:@"+"]) result = number + self.secondNumber;
        else if ([@"-" isEqualToString:opera]) result = number - self.secondNumber;
        else if ([opera isEqualToString:@"*"]) result = number * self.secondNumber;
        else if ([opera isEqualToString:@"/"]) result = number / self.secondNumber;
        
        return  result;
    }
    
}
- (void)zero {
    [self.operandStack removeAllObjects];
    
    
    
}
- (void)pushNumberInStack:(double)aDouble  andBool:(BOOL)aBool {
    
    double number = aDouble;
    NSNumber *operand = [NSNumber numberWithDouble:number];
    [self.operandStack addObject:operand];
    if(!aBool) {
        self.secondNumber = [[self.operandStack lastObject]doubleValue];}
    
    
}
- (void)pushOperation:(NSString *)operati
{
    self.symbol = [operati characterAtIndex:0];
    
    
}
@end
