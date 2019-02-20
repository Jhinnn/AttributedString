//
//  ViewController.m
//  AttributedString
//
//  Created by Arthur on 2018/6/8.
//  Copyright © 2018年 Arthur. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *discLabel1;
@property (nonatomic, strong) UILabel *discLabel2;

@property (nonatomic, strong) UILabel *attrLabel;
@property (nonatomic, strong) UILabel *attrLabel3;
@property (nonatomic, strong) UILabel *attrLabel4;

@property (nonatomic, strong) UILabel *attrLabel1;
@property (nonatomic, strong) UILabel *attrLabel2;



@property (nonatomic, strong) UIButton *attrButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpView];
    
    //1.修改指定字符串
    NSString *rate = @"3.2%";
    NSString *textStr = [NSString stringWithFormat:@"年化收益率为%@",rate];
    _attrLabel.attributedText = [self changeStr:rate andChangeColor:[UIColor redColor] andChangeFont:[UIFont boldSystemFontOfSize:20] andWholeStr:textStr andWholeStringColor:[UIColor whiteColor] andWholeStringFont:[UIFont systemFontOfSize:14]];
    
    
    NSString *money = @"999";
    NSString *textStr3 = [NSString stringWithFormat:@"手机%@元",money];
    _attrLabel3.attributedText = [self changeStr:money andChangeColor:[UIColor redColor] andChangeFont:[UIFont boldSystemFontOfSize:24] andWholeStr:textStr3 andWholeStringColor:[UIColor grayColor] andWholeStringFont:[UIFont systemFontOfSize:16]];
    
    NSString *money1 = @"99.99";
    NSString *textStr4 = [NSString stringWithFormat:@"跳楼价%@元",money1];
    _attrLabel4.attributedText = [self changeStr:money1 andChangeColor:[UIColor redColor] andChangeFont:[UIFont boldSystemFontOfSize:24] andWholeStr:textStr4 andWholeStringColor:[UIColor whiteColor] andWholeStringFont:[UIFont systemFontOfSize:16]];
    
    
    
    //2.修改后n位字符串
    NSString *textStr1 = @"注册返现8%";
    NSString *textStr2 = @"注册返现$100";
    
    _attrLabel1.attributedText = [self changeColor:[UIColor blueColor] andChangeFont:[UIFont italicSystemFontOfSize:18] changeStrIndex:4 andWholeStr:textStr1 andWholeStringColor:[UIColor yellowColor] andWholeStringFont:[UIFont boldSystemFontOfSize:12]];
    
    _attrLabel2.attributedText = [self changeColor:[UIColor cyanColor] andChangeFont:[UIFont systemFontOfSize:19] changeStrIndex:4 andWholeStr:textStr2 andWholeStringColor:[UIColor whiteColor] andWholeStringFont:[UIFont systemFontOfSize:9]];

}

- (void)setUpView {
    [self.view addSubview:self.discLabel1];
    [self.view addSubview:self.attrLabel];
    [self.view addSubview:self.attrLabel3];
    [self.view addSubview:self.attrLabel4];
    [self.view addSubview:self.discLabel2];
    
    [self.view addSubview:self.attrLabel1];
    [self.view addSubview:self.attrLabel2];
}



/**
 改变指定字符串在指定字符串中的颜色和字体大小

 @param changeStr 需要改变的文字
 @param changeColor 需要改变的文字的颜色
 @param changeFont 需要改变的文字的字体
 @param wholeStr 所有文字的内容
 @param wholeColor 所有文字的颜色
 @param wholeFont 所有文字的字体
 @return 返回富文本字符串
 */
-(NSMutableAttributedString*)changeStr:(NSString * )changeStr andChangeColor:(UIColor*)changeColor andChangeFont:(UIFont*)changeFont andWholeStr:(NSString*)wholeStr andWholeStringColor:(UIColor*)wholeColor andWholeStringFont:(UIFont*)wholeFont {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:wholeStr];
    [attrString addAttribute:NSForegroundColorAttributeName value:wholeColor range:NSMakeRange(0,wholeStr.length)];
    [attrString addAttribute:NSFontAttributeName value:wholeFont range:NSMakeRange(0,wholeStr.length)];
    NSRange range = [wholeStr rangeOfString:changeStr];
    [attrString addAttribute:NSForegroundColorAttributeName value:changeColor range:range];
    [attrString addAttribute:NSFontAttributeName value:changeFont range:range];
    return attrString;
    
}


/**
 改变指定位置之后的字符串的颜色和文字

 @param changeColor 需要改变的文字的颜色
 @param changeFont 需要改变的文字的字体
 @param index 指定的位置
 @param wholeStr 所有文字的内容
 @param wholeColor 所有文字的颜色
 @param wholeFont 所有文字的字体
 @return 返回富文本字符串
 */
- (NSMutableAttributedString *)changeColor:(UIColor*)changeColor andChangeFont:(UIFont*)changeFont changeStrIndex:(NSInteger)index andWholeStr:(NSString*)wholeStr andWholeStringColor:(UIColor*)wholeColor andWholeStringFont:(UIFont*)wholeFont  {
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:wholeStr];
    
    
    [attrString addAttribute:NSForegroundColorAttributeName value:wholeColor range:NSMakeRange(0,wholeStr.length)];
    [attrString addAttribute:NSFontAttributeName value:wholeFont range:NSMakeRange(0,wholeStr.length)];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:changeColor range:NSMakeRange(index, wholeStr.length - index)];
    [attrString addAttribute:NSFontAttributeName value:changeFont range:NSMakeRange(index, wholeStr.length - index)];
    
    return attrString;
}

- (UILabel *)discLabel1 {
    if (!_discLabel1) {
        _discLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200) / 2, 50, 200, 40)];
        _discLabel1.textAlignment = NSTextAlignmentCenter;
        _discLabel1.textColor = [UIColor blackColor];
        _discLabel1.text = @"修改指定的字符串:";
    }
    return _discLabel1;
}



- (UILabel *)attrLabel3 {
    if (!_attrLabel3) {
        _attrLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200) / 2, 100, 200, 40)];
        _attrLabel3.backgroundColor = [UIColor blackColor];
        _attrLabel3.textAlignment = NSTextAlignmentCenter;
    }
    return _attrLabel3;
}

- (UILabel *)attrLabel4 {
    if (!_attrLabel4) {
        _attrLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200) / 2, 150, 200, 40)];
        _attrLabel4.backgroundColor = [UIColor blackColor];
        _attrLabel4.textAlignment = NSTextAlignmentCenter;
    }
    return _attrLabel4;
}

- (UILabel *)attrLabel {
    if (!_attrLabel) {
        _attrLabel = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200) / 2, 200, 200, 40)];
        _attrLabel.backgroundColor = [UIColor blackColor];
        _attrLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _attrLabel;
}

- (UILabel *)discLabel2 {
    if (!_discLabel2) {
        _discLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width - 200) / 2, 250, 200, 40)];
        _discLabel2.textAlignment = NSTextAlignmentCenter;
        _discLabel2.textColor = [UIColor blackColor];
        _discLabel2.text = @"修改后n(4)位的字符串:";
    }
    return _discLabel2;
}


- (UILabel *)attrLabel1 {
    if (!_attrLabel1) {
        _attrLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(50, 300, 120, 40)];
        _attrLabel1.backgroundColor = [UIColor blackColor];
        _attrLabel1.textAlignment = NSTextAlignmentCenter;
    }
    return _attrLabel1;
}

- (UILabel *)attrLabel2 {
    if (!_attrLabel2) {
        _attrLabel2 = [[UILabel alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 120 - 50 , 300, 120, 40)];
        _attrLabel2.backgroundColor = [UIColor blackColor];
        _attrLabel2.textAlignment = NSTextAlignmentCenter;
    }
    return _attrLabel2;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
