# README

# 1. Zaojiu-swift3
基于swift3.0的app

# 2. Basic Usage
该项目使用carthage进行包管理，使用方法如下：

1. 推荐使用brew安装Carthage: `brew install carthage`
2. cd到Cartfile所在位置，然后命令:  `carthage bootstrap --platform ios`
3. 提交PR时不要把 Carthage文件夹提交上来
4. Carthage的用法可参考：https://github.com/Carthage/Carthage

# 3. 我的编码思路
## 1. 采用MVVM模式
## 2. 采用ReactiveSwift的库，保证V与VM之间的通信
## 3. 一个模块对应一个接口，为了便于扩展，本来应该写一个protocol，专门用来定义这些接口，然后利用IoC来调用, 但我觉得现在写有点浪费时间，所以就直接写了实现
## 4. 采用signal与observe的方式，使用alamofire，保证各个模块(接口)的网络请求不相互影响，这样能保证UI的流畅，实现题目要求
