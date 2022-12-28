//
//  CalculatorModel.m
//  TheCalculator
//
//  Created by zzy on 2022/9/28.
//

#import "CalculatorModel.h"

@implementation CalculatorModel




-(void)numPushInn:(double)num {
    if (_numArray.count == 50) {
        return;
    }
    [_numArray insertObject:[NSString stringWithFormat:@"%f",num] atIndex:_numArray.count ];
    return;
}
-(void)characterPushInn:(char)ch {
    if (_characterArray.count == 50) {
        return;
    }
    [_characterArray insertObject:[NSString stringWithFormat:@"%c",ch] atIndex:_characterArray.count];
    return;
}
-(void)numOutInn:(NSMutableArray *)s {
    [_numArray removeObjectAtIndex:([_numArray count] - 1)];
}
-(void)characterOutInn:(NSMutableArray *)s {
    [_characterArray removeObjectAtIndex:([_characterArray count] - 1)];
}


-(int)judgement:(char)chara and:(char *)arr {
    for (int i = 0; i < 7; i++) {
        if (chara == arr[i]) {
            return 1;
        }
    }
    return 0;
}











-(char)compare:(char)charac {
    int topTest[7][7] = {
                { 2, 2, 1, 1, 1, 2, 2 },
                { 2, 2, 1, 1, 1, 2, 2 },
                { 2, 2, 2, 2, 1, 2, 2 },
                { 2, 2, 2, 2, 1, 2, 2 },
                { 1, 1, 1, 1, 1, 3, 0 },
                { 2, 2, 2, 2, 0, 2, 2 },
                { 1, 1, 1, 1, 1, 0, 3 }
    };
    
    
    
    NSMutableArray *a = [[NSMutableArray alloc] initWithObjects:@"+", @"-", @"x", @"/", @"(", @")",@"#", nil];
    
    
    
    char b[7] = {'+','-','x','/','(',')','#'};
    int m = 0, n = 0, i, targer;
    char ch = '\0';
    
    
    
    for (i = 0; i < 7; i++) {
        if (charac == b[i]) {
            m = i;
        }
        if ([_characterArray[_characterArray.count - 1] isEqual: a[i]]) {
            n = i;
        }
    }
    
    
    
    targer = topTest[n][m];
    
    
    switch (targer) {
        case 1:
            return (char)('>');
        case 2:
            return (char)('<');
        case 3:
            return (char)('=');
        default:
            printf("表达式错误!\n");
            break;
    }
    return ch;
}

- (double)change:(NSMutableString *)s {
    int firstFlag = 0, secondFlag = 0;
    
    
    
    double sum = 0, num = 0;
    
    
    if ([s characterAtIndex:0] == '-') {
        firstFlag = 1;
    } else {
        num = [s characterAtIndex:0] - '0';
    }
    
    
    
    if (s.length > 1) {
        for (int i = 1; i < s.length; i++) {
            if ([s characterAtIndex:i] == '.') {
                sum += num;
                secondFlag = 1;
                i++;
                num = 0.1 * ((double)[s characterAtIndex:i] - '0');
                continue;
            } else {
                if (secondFlag == 0) {
                    num = num * 10 + (double)[s characterAtIndex:i] - '0';
                } else {
                    secondFlag++;
                    num = num + ((double)[s characterAtIndex:i] - '0') * pow(10, -secondFlag);
                }
            }
        }
        sum += num;
    }
    if (firstFlag) {
        sum *= -1;
    } else {
        sum = sum;
    }
    return sum;
}

-(double)calculate {
    double testResult = 0;
    double num1,num2;
    char ch = '\0';
    num1 = [self change:_numArray[_numArray.count - 2]];
    num2 = [self change:_numArray[_numArray.count - 1]];
    
    if ([_characterArray[_characterArray.count - 1] isEqual:@"+"]) {
        ch = '+';
    }
    
    if ([_characterArray[_characterArray.count - 1] isEqual:@"-"]) {
        ch = '-';
    }

    if ([_characterArray[_characterArray.count - 1] isEqual:@"x"]) {
        ch = '*';
    }

    if ([_characterArray[_characterArray.count - 1] isEqual:@"/"]) {
        ch = '/';
    }
    
    switch (ch) {
        case '+':
            testResult = num1 + num2;
            break;
        case '-':
            testResult = num1 - num2;
            break;
        case '*':
            testResult = num1 * num2;
            break;
        case '/':
            testResult = num1 / num2;
            break;
    }
    return testResult;
}



-(int)count:(char *)a {
    if ([_test characterAtIndex:_test.length - 2] == '+' || [_test characterAtIndex:_test.length - 2]== '-' || [_test characterAtIndex:_test.length - 2] == 'x' || [_test characterAtIndex:_test.length - 2] == '/') {
        _numArray[0] = @"099";
        return 1;
    }
    for (int i = 0; i < _test.length; i++) {
        if ([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == ')') {
            _numArray[0] = @"099";
            return 1;
        }
        NSLog(@"888");
        if ([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i+1] == '(') {
            _numArray[0] = @"099";
            return 1;
        }
        if ([_test characterAtIndex:i] == '/' && [_test characterAtIndex:i+1] == '0') {
            _numArray[0] = @"099";
            return 1;
        }
        if (([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == '+')||([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == '-')||([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == 'x')||([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == '/')) {
            _numArray[0] = @"099";
            return 1;
        }
        if (([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i-1] == '+')||([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i-1] == '-')||([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i-1] == 'x')||([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i-1] == '/')) {
            _numArray[0] = @"099";
            return 1;
        }
        if(([_test characterAtIndex:i] == '+'||[_test characterAtIndex:i] == '-'||[_test characterAtIndex:i] == 'x'||[_test characterAtIndex:i] == '/')&&([_test characterAtIndex:i+1] == '+'||[_test characterAtIndex:i+1] == '-'||[_test characterAtIndex:i+1] == 'x'||[_test characterAtIndex:i+1] == '/')) {
            _numArray[0] = @"099";
            return 1;
        }
        if ([_test characterAtIndex:i] == '.' && [_test characterAtIndex:i+1] == '(') {
            _numArray[0] = @"099";
            return 1;
        }
        if ([_test characterAtIndex:i] == ')' && [_test characterAtIndex:i+1] == '.') {
            _numArray[0] = @"099";
            return 1;
        }
        if ([_test characterAtIndex:i] == '.' && [_test characterAtIndex:i+1] == ')') {
            _numArray[0] = @"099";
            return 1;
        }
        if ([_test characterAtIndex:i] == '(' && [_test characterAtIndex:i+1] == '.') {
            _numArray[0] = @"099";
            return 1;
        }
    }
    char ch;
    double data, result, i = 0, flag = 0, flag1 = 0,temp = 0;
    int index = 1;
    [self characterPushInn:'#'];
    ch = [_test characterAtIndex:i];
    while (ch != '#' || ![_characterArray[_characterArray.count - 1]  isEqual: @"#"]) {
        if (![self judgement:ch and:a] || (i == 0 && ch == '-')) {
            index = 1;
            if ((i == 0 && ch == '-')) {
                flag = 1;
                i++;
                ch = [_test characterAtIndex:i];
                continue;
            }
            data = ch - '0';
            i++;
            ch = [_test characterAtIndex:i];
            while (![self judgement:ch and:a]) {
                if (ch == '.') {
                    flag1 = 1;
                    i++;
                    ch = [_test characterAtIndex:i];
                    continue;
                }
                if (flag1 == 1) {
                   temp = (ch - '0') * pow(10, -index);
                    index++;
                    data += temp;
                } else {
                data = data * 10 + ch - '0';
              }
                i++;
                ch = [_test characterAtIndex:i];
            }
            if (flag == 1) {
                data *= -1;
                flag = 0;
            }
            flag1 = 0;
            [self numPushInn:data];
        } else {
            switch ([self compare:ch]) {
                case '>':
                    [self characterPushInn:ch];
                    i++;
                    ch = [_test characterAtIndex:i];
                    break;
                case '=':
                    [self characterOutInn:_characterArray];
                    i++;
                    ch = [_test characterAtIndex:i];
                    break;
                case '<':
                    result = [self calculate];
                    [self characterOutInn:_characterArray];
                    [self numOutInn:_numArray];
                    [self numOutInn:_numArray];
                    [self numPushInn:result];
                    break;
            }
        }
    }
    return 0;
}


@end
