//
//  CalculatorView.h
//  TheCalculator
//
//  Created by zzy on 2022/9/28.
//

#import <UIKit/UIKit.h>

@protocol viewDelegate <NSObject>

- (void) pressChange: (UIButton*) Button;

@end

NS_ASSUME_NONNULL_BEGIN

@interface CalculatorView : UIView
//@property (nonatomic, strong) UILabel* topLabel;
@property (nonatomic, strong) UITextField *mainTextField;
@property (nonatomic, strong) UIButton* normalButton;
@property (nonatomic, strong) UIButton* zeroButton;
@property (nonatomic,strong)  UIButton *pointButton;
@property (nonatomic,strong)  UIButton *resultButton;


@property (nonatomic, weak) id<viewDelegate> delegate;


@end

NS_ASSUME_NONNULL_END

