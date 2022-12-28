//
//  CalculatorView.m
//  TheCalculator
//
//  Created by zzy on 2022/9/28.
//

#import "CalculatorView.h"
#import "Masonry.h"

@implementation CalculatorView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];

    
    self.backgroundColor = [UIColor blackColor];
    
    
    
    int i,j;
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            _normalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [_normalButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_normalButton];
            _normalButton.layer.cornerRadius = 45;
            _normalButton.layer.borderWidth = 1;
                [_normalButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
            _normalButton.titleLabel.font = [UIFont systemFontOfSize:45];
            
            
                [_normalButton mas_makeConstraints:^(MASConstraintMaker *make){
                        make.top.equalTo(@(self.frame.size.height/3 + 100 * i + 80));
                        make.left.equalTo(@(10+(j*100)));
                        make.height.equalTo(@90);
                    make.width.equalTo(@90);
                }];
            if (i == 0 && j != 3) {
                _normalButton.backgroundColor = [UIColor colorWithRed:0.30 green:0.30 blue:0.30 alpha:1];
                if (j == 0) {
                    [_normalButton setTitle:@"C" forState:UIControlStateNormal];
                    _normalButton.tag = 18;
                }
                if (j == 1) {
                    [_normalButton setTitle:@"(" forState:UIControlStateNormal];
                    _normalButton.tag = 16;
                }
                if (j == 2) {
                    [_normalButton setTitle:@")" forState:UIControlStateNormal];
                    _normalButton.tag = 17;
                }
            }
            if (j == 3) {
                _normalButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.25 alpha:1];
                if (i == 3) {
                    [_normalButton setTitle:@"+" forState:UIControlStateNormal];
                    _normalButton.tag = 12;
                }
                if (i == 2) {
                    [_normalButton setTitle:@"-" forState:UIControlStateNormal];
                    _normalButton.tag = 13;
                }
                if (i == 1) {
                    [_normalButton setTitle:@"×" forState:UIControlStateNormal];
                    _normalButton.tag = 14;
                }
                if (i == 0) {
                    [_normalButton setTitle:@"÷" forState:UIControlStateNormal];
                    _normalButton.tag = 15;
                }
            }
            if (i != 0 && j != 3) {
                _normalButton.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1];
                if (i == 3 && j == 0) {
                    [_normalButton setTitle:@"1" forState:UIControlStateNormal];
                    _normalButton.tag = 1;
                }
                if (i == 3 && j == 1) {
                    [_normalButton setTitle:@"2" forState:UIControlStateNormal];
                    _normalButton.tag = 2;
                }
                if (i == 3 && j == 2) {
                    [_normalButton setTitle:@"3" forState:UIControlStateNormal];
                    _normalButton.tag = 3;
                }
                if (i == 2 && j == 0) {
                    [_normalButton setTitle:@"4" forState:UIControlStateNormal];
                    _normalButton.tag = 4;
                }
                if (i == 2 && j == 1) {
                    [_normalButton setTitle:@"5" forState:UIControlStateNormal];
                    _normalButton.tag = 5;
                }
                if (i == 2 && j == 2) {
                    [_normalButton setTitle:@"6" forState:UIControlStateNormal];
                    _normalButton.tag = 6;
                }
                if (i == 1 && j == 0) {
                    [_normalButton setTitle:@"7" forState:UIControlStateNormal];
                    _normalButton.tag = 7;
                }
                if (i == 1 && j == 1) {
                    [_normalButton setTitle:@"8" forState:UIControlStateNormal];
                    _normalButton.tag = 8;
                }
                if (i == 1 && j == 2) {
                    [_normalButton setTitle:@"9" forState:UIControlStateNormal];
                    _normalButton.tag = 9;
                }
            }
        }
    }
    
    
    
    
    
    
    
    _zeroButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_zeroButton];
    _zeroButton.layer.cornerRadius = 45;
    _zeroButton.layer.borderWidth = 1;
    _zeroButton.tag = 0;
    [_zeroButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    [_zeroButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _zeroButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_zeroButton setTitle:@"0" forState:UIControlStateNormal];
    _zeroButton.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1];
    [_zeroButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@10);
            make.height.equalTo(@90);
            make.width.equalTo(@180);
    }];
    
    
    
    
    
    _pointButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_pointButton];
    _pointButton.layer.cornerRadius = 45;
    _pointButton.layer.borderWidth = 1;
    [_pointButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    _pointButton.tag = 10;
    [_pointButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _pointButton.titleLabel.font = [UIFont systemFontOfSize:45];
    _pointButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_pointButton setTitle:@"·" forState:UIControlStateNormal];
    _pointButton.backgroundColor = [UIColor colorWithRed:0.15 green:0.15 blue:0.15 alpha:1];
    [_pointButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@210);
            make.height.equalTo(@90);
        make.width.equalTo(@90);
    }];

    
    _resultButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self addSubview:_resultButton];
    _resultButton.layer.cornerRadius = 45;
    _resultButton.layer.borderWidth = 1;
    _resultButton.tag = 11;
    [_resultButton addTarget:self action:@selector(pressChange:) forControlEvents:UIControlEventTouchUpInside];
    [_resultButton setTitleColor:[UIColor whiteColor]forState:UIControlStateNormal];
    _resultButton.titleLabel.font = [UIFont systemFontOfSize:45];
    _resultButton.titleLabel.font = [UIFont systemFontOfSize:45];
    [_resultButton setTitle:@"=" forState:UIControlStateNormal];
    _resultButton.backgroundColor = [UIColor colorWithRed:0.9 green:0.5 blue:0.25 alpha:1];
    [_resultButton mas_makeConstraints:^(MASConstraintMaker *make){
            make.top.equalTo(@(self.frame.size.height / 3 + 480));
            make.left.equalTo(@310);
            make.height.equalTo(@90);
        make.width.equalTo(@90);
    }];
    
    
    
    
    
    _mainTextField = [[UITextField alloc] init];
    
    _mainTextField.textColor = [UIColor whiteColor];
    _mainTextField.textAlignment = NSTextAlignmentRight;
    _mainTextField.font = [UIFont systemFontOfSize:65];
    [self addSubview:_mainTextField];
    
    [_mainTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@(15));
        make.width.equalTo(@(self.frame.size.width - 30));
        make.top.equalTo(@(self.frame.size.height - (((self.frame.size.width - 75) / 4) * 5 + 245)));
        make.height.equalTo(@(120));
    }];

    return self;
    
}
-(void)pressChange:(UIButton *)Button {
    [_delegate pressChange:Button];
}
@end
