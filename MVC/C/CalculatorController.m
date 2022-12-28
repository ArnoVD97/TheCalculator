//
//  CalculatorController.m
//  TheCalculator
//
//  Created by zzy on 2022/9/28.
//

#import "CalculatorController.h"
#import "CalculatorModel.h"
#import "CalculatorView.h"

@interface CalculatorController ()<viewDelegate>
@property (nonatomic,strong)CalculatorView *firstView;
@property (nonatomic,strong)CalculatorModel *model;
@property (nonatomic,strong)NSMutableString *function;
@property (nonatomic,strong)NSMutableString *yumual;
@end

@implementation CalculatorController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    _firstView = [[CalculatorView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_firstView];
    _function = [[NSMutableString alloc]init];
    _model = [[CalculatorModel alloc]init];
    _yumual = [[NSMutableString alloc]init];
    _firstView.delegate = self;
}



int left = 0;
- (void)pressChange:(UIButton *)Button {
    if (Button.tag <= 9 && Button.tag >= 0) {
        [_yumual appendString:[NSString stringWithFormat:@"%ld",Button.tag]];
        [_function appendString:[NSString stringWithFormat:@"%ld",Button.tag]];
    } else if (Button.tag == 12) {
        if (_yumual.length == 0) {
            _firstView.mainTextField.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_yumual substringFromIndex:_yumual.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
            }
        }
        [_yumual appendString:[NSString stringWithFormat:@"+"]];
        [_function appendString:[NSString stringWithFormat:@"+"]];
    } else if (Button.tag == 13) {
        if (_yumual.length != 0) {
        NSString *lastStr = [_yumual substringFromIndex:_yumual.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
        }
        }
        [_yumual appendString:[NSString stringWithFormat:@"-"]];
        [_function appendString:[NSString stringWithFormat:@"-"]];
    } else if (Button.tag == 14) {
        if (_yumual.length == 0) {
            _firstView.mainTextField.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_yumual substringFromIndex:_yumual.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
            }
        }
        [_yumual appendString:[NSString stringWithFormat:@"x"]];
        [_function appendString:[NSString stringWithFormat:@"x"]];
    } else if (Button.tag == 15) {
        if (_yumual.length == 0) {
            _firstView.mainTextField.text = @"格式有误";
            return ;
        } else {
        NSString *lastStr = [_yumual substringFromIndex:_yumual.length - 1];
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"("]]) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
            }
        }
        [_yumual appendString:[NSString stringWithFormat:@"/"]];
        [_function appendString:[NSString stringWithFormat:@"/"]];
    } else if (Button.tag == 16) {
        if (_yumual.length >= 1) {
        NSString *lastStr = [_yumual substringFromIndex:_yumual.length - 1];
        for (int i = 0; i <= 10; i++) {
            if ([lastStr isEqualToString:[NSString stringWithFormat:@"%c",i + '0' ] ]) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
            }
        }
        }
        [_yumual appendString:[NSString stringWithFormat:@"("]];
        [_function appendString:[NSString stringWithFormat:@"("]];
        left++;
    } else if (Button.tag == 17) {
        if (left > 0) {
            [_yumual appendString:[NSString stringWithFormat:@")"]];
            [_function appendString:[NSString stringWithFormat:@")"]];
            left--;
        }
        
    } else if (Button.tag == 10) {
        if (_yumual.length <= 1 ) {
            [_yumual insertString:@"0" atIndex:0];
        } else if (_yumual.length > 1 && (([[_function substringFromIndex:_function.length - 1]  isEqual: @"+"]) || ([[_function substringFromIndex:_function.length - 1]  isEqual: @"-"]) || ([[_function substringFromIndex:_function.length - 1]  isEqual: @"x"]) || ([[_function substringFromIndex:_function.length - 1]  isEqual: @"/"]))) {
            [_yumual appendFormat:@"0"];
        }
        [_yumual appendString:[NSString stringWithFormat:@"."]];
        [_function appendString:[NSString stringWithFormat:@"."]];
    } else if (Button.tag == 18) {
        [_yumual setString:@""];
        [_function setString:@""];
    } else if (Button.tag == 11) {
            
        char a[7] = {'+','-','x','/','(',')','#'};
        int testFlag = 0;
        for (int i = 0; i < _yumual.length; i++) {
            int secondTestFlag = 0, thirdTestFlag = 0;
            if ([_yumual characterAtIndex:i] == '(') {
                testFlag++;
            }
            if ([_yumual characterAtIndex:i] == ')') {
                testFlag--;
            }
            for (int j = 0; j < 4; j++) {
                if (i != _yumual.length - 1 ) {
                    if ([_yumual characterAtIndex:i] == a[j] && [_yumual characterAtIndex:0] != a[1]) {
                        secondTestFlag = 1;
                    }
                    if ([_yumual characterAtIndex:i + 1] == a[j]) {
                        thirdTestFlag = 1;
                    }
                }
            }
            if (secondTestFlag == 1 && thirdTestFlag == 1) {
                _firstView.mainTextField.text = @"格式有误";
                return ;
            }
        }
        if (testFlag != 0) {
            _firstView.mainTextField.text = @"格式有误";
            return ;
        }
        
        [_yumual appendString:@"#"];
        _model.test = _yumual;
        _model.numArray = [[NSMutableArray alloc]init];
        _model.characterArray = [[NSMutableArray alloc]init];
        [_model count:a];
        if ([_model.numArray[0] isEqualToString:@"099"]) {
            [_function setString:[NSString stringWithFormat:@"error"]];
        } else
        [_function setString:[NSString stringWithFormat:@"%@", [self removeFloatAllZeroByString:_model.numArray[0]]]];
    }
    _firstView.mainTextField.text = _function;
}



//qu 0
- (NSString*)removeFloatAllZeroByString:(NSString *)testNumber {
    
    NSString * outNumber = [NSString stringWithFormat:@"%@",@(testNumber.floatValue)];
    return outNumber;
}

@end
