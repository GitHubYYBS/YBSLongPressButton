# YBSLongPressButton
可自定义极高的 长按按钮 让按钮事件持续响应的按钮封装类
### ````先看效果````
- ![Alt text](https://github.com/GitHubYYBS/YBSLongPressButton/blob/master/%E6%95%88%E6%9E%9C%E5%9B%BE.gif?raw=true)

#### 设计思路:
- 1.按钮继承自 UIButton 保证高度的可自定义暴露系统类的所有方法给外界 封装内部只做 事件的持续响应和 取消响应 
- 2.运用定时器 来实现 事件的持续响应
- 3.响应事件未实现 进行程序保护 防止崩溃 这一点优于系统



#### ipa
````
/**
 创建可以长按 持续响应事件的按钮

 @param target 监听者`
 @param action 事件/函数
 @param longPressSpaceTime 响应事件的时间间距 多长时间响应一次
 @return 啦啦
 */
+ (instancetype)ybs_LongPressButtonTarget:(id)target action:(SEL)action longPressSpaceTime:(CGFloat )longPressSpaceTime;

````


#### 使用-超级简单
````
YBSLongPressButton *addBtn = [YBSLongPressButton ybs_LongPressButtonTarget:self action:@selector(clickAddBtn) longPressSpaceTime:0.1];
    addBtn.frame = CGRectMake(self.view.bounds.size.width * 0.25 - 50, CGRectGetMaxY(lable.frame) + 100, 100, 50);
    addBtn.backgroundColor = [UIColor redColor];
    [addBtn setTitle:@"点我+" forState:0];
    [self.view addSubview:addBtn];
````
