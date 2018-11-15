//
//  YBSLongPressButton.h
//  Warehouse_10
//
//  Created by 严兵胜 on 2018/11/14.
//  Copyright © 2018年 陈樟权. All rights reserved.
//  按钮 按住不动 会持续响应事件

#import <UIKit/UIKit.h>

@interface YBSLongPressButton : UIButton


/**
 创建可以长按 持续响应事件的按钮

 @param target 监听者`
 @param action 事件/函数
 @param longPressSpaceTime 响应事件的时间间距 多长时间响应一次
 @return 啦啦
 */
+ (instancetype)ybs_LongPressButtonTarget:(id)target action:(SEL)action longPressSpaceTime:(CGFloat )longPressSpaceTime;

@end
