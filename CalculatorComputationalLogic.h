//
//  CalculatorComputationalLogic.h
//  Calculator
//
//  Created by 侯琛 on 16/6/4.
//  Copyright © 2016年 HouChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorComputationalLogic : NSObject
- (void)pushOperation:(NSString *)operation;
- (double)result:(BOOL)secondEq;
- (void)zero;
- (void)pushNumberInStack:(double)aDouble  andBool:(BOOL)aBool;
@end
