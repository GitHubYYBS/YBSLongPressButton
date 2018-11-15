//
//  ViewController.m
//  YBSLongPressButton
//
//  Created by 严兵胜 on 2018/11/15.
//  Copyright © 2018年 严兵胜. All rights reserved.
//

#import "ViewController.h"

#import "YBSLongPressButton.h"

@interface ViewController ()
/// <# 请输入注释 #>
@property (nonatomic, weak) UILabel *lable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UILabel *lable = [UILabel new];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.frame = CGRectMake(self.view.bounds.size.width * 0.5 - 50, 100, 100, 80);
    lable.font = [UIFont boldSystemFontOfSize:23];
    [self.view addSubview:_lable = lable];
    
    
    // 加号
    YBSLongPressButton *addBtn = [YBSLongPressButton ybs_LongPressButtonTarget:self action:@selector(clickAddBtn) longPressSpaceTime:0.1];
    addBtn.frame = CGRectMake(self.view.bounds.size.width * 0.25 - 50, CGRectGetMaxY(lable.frame) + 100, 100, 50);
    addBtn.backgroundColor = [UIColor redColor];
    [addBtn setTitle:@"点我+" forState:0];
    [self.view addSubview:addBtn];
    
    
    // 减号
    YBSLongPressButton *minusBtn = [YBSLongPressButton ybs_LongPressButtonTarget:self action:@selector(clickMinusBtn) longPressSpaceTime:0.1];
    minusBtn.frame = CGRectMake(self.view.bounds.size.width * 0.75 - 50, CGRectGetMaxY(lable.frame) + 100, 100, 50);
    minusBtn.backgroundColor = [UIColor redColor];
    [minusBtn setTitle:@"点我-" forState:0];
    [self.view addSubview:minusBtn];
    
    
    
}

#pragma mark - 点击事件

- (void)clickAddBtn{
    
    self.lable.text = [NSString stringWithFormat:@"%.0f",[self.lable.text floatValue] + 1];
}



- (void)clickMinusBtn{
    
    self.lable.text = [NSString stringWithFormat:@"%.0f",[self.lable.text floatValue] - 1];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
