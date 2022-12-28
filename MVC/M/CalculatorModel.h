//
//  CalculatorModel.h
//  TheCalculator
//
//  Created by zzy on 2022/9/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorModel : NSObject

@property (nonatomic, strong) NSMutableArray *numArray;
@property (nonatomic, strong) NSMutableArray *characterArray;
@property (nonatomic, strong) NSString *test;
@property (nonatomic, strong) NSNumber *result;
-(int)count:(char *)a;

@end

NS_ASSUME_NONNULL_END
