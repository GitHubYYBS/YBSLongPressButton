//
//  YBSLongPressButton.m
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/11/14.
//  Copyright © 2018年 陈樟权. All rights reserved.
//

#import "YBSLongPressButton.h"


/**
 给 按钮做内部逻辑的view 不想暴露给外界
 */


@interface YBSLongPressButtonTargetViewTool : UIView

/// 点击或者长按 时 外界函数监听者 ->
@property (nonatomic, weak) id target;
/// 外界函数 在长按 或者 点击时 都会持续调用该方法
@property (nonatomic, assign) SEL action;

/// 快速加减定时器
@property (nonatomic, strong) NSTimer *timer;
/// 定时器的时间间隔
@property (nonatomic, assign) CGFloat longPressSpaceTime;
@end

//static YBSLongPressButtonTargetViewTool *shareTargetView;
@implementation YBSLongPressButtonTargetViewTool


//- (instancetype)initWithFrame:(CGRect)frame{
//
//    if ((shareTargetView = [super initWithFrame:frame])) {
//
//    }
//    return shareTargetView;
//}

#pragma mark - 点击事件

/// 向下-点击了
- (void)ybs_touchDown:(UIButton *)sender{
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_longPressSpaceTime target:self selector:@selector(ybs_transferTargetAction) userInfo:nil repeats:YES];
    [_timer fire];
}

/// 手指松开
- (void)ybs_touchUp:(UIButton *)sender{
   
    if (_timer.isValid) { [_timer invalidate] ; _timer = nil;}
}

#pragma mark - 其他

/// 将点击事件 以及 计时事件 告知外界
- (void)ybs_transferTargetAction{
    
    if ([self.target respondsToSelector:self.action]) {
        IMP imp = [self.target methodForSelector:self.action];
        void (*func)(id, SEL) = (void *)imp;
        func(self.target, self.action);
    }else{
        NSLog(@"----傻逼 你的响应方法实现了嘛-----不崩溃是给你面子");
    }
}



- (void)dealloc{
    
    NSLog(@"%s_%@_长按响应_按钮_中间控件_消失了", __func__,[self class]);
    if (_timer.isValid) { [_timer invalidate] ; _timer = nil;}
    
}

@end



@interface YBSLongPressButton ()

/// 处理长按业务的中间控件
@property (nonatomic, strong) YBSLongPressButtonTargetViewTool *targetView;

@end



@implementation YBSLongPressButton

+ (instancetype)ybs_LongPressButtonTarget:(id)target action:(SEL)action longPressSpaceTime:(CGFloat)longPressSpaceTime{
    
    YBSLongPressButton *btn = [[YBSLongPressButton alloc] init];
    
    btn.targetView = [[YBSLongPressButtonTargetViewTool alloc] initWithFrame:CGRectZero];
    btn.targetView.target = target;
    btn.targetView.action = action;
    btn.targetView.longPressSpaceTime = longPressSpaceTime;
    
    
    [btn addTarget:btn.targetView action:@selector(ybs_touchDown:) forControlEvents:UIControlEventTouchDown];
    [btn addTarget:btn.targetView action:@selector(ybs_touchUp:) forControlEvents:UIControlEventTouchUpOutside|UIControlEventTouchUpInside|UIControlEventTouchCancel];
    
    return btn;
}

- (void)dealloc{
    
    NSLog(@"%s_%@_长按按钮消失了", __func__,[self class]);
    self.targetView = nil;
}

@end


