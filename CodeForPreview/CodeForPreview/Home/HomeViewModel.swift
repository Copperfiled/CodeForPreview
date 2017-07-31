//
//  HomeViewModel.swift
//  CodeForPreview
//
//  Created by guanxiaobai on 31/07/2017.
//  Copyright © 2017 guanxiaobai. All rights reserved.
//

import UIKit
import ReactiveSwift
import Result

class HomeViewModel {
    let (loadFirstSignal, loadFirstObserver) = Signal<Bool, NoError>.pipe()
    let (loadSecondSignal, loadSecondObserver) = Signal<Bool, NoError>.pipe()
    let (loadThirdSignal, loadThirdObserver) = Signal<Bool, NoError>.pipe()
    let (loadFourthSignal, loadFourthObserver) = Signal<Bool, NoError>.pipe()
    let (loadFifthSignal, loadFifthObserver) = Signal<Bool, NoError>.pipe()
    
    var dataSource = ["A正在加载中",
                      "B正在加载中",
                      "C正在加载中",
                      "D正在加载中",
                      "E正在加载中"]
    
    init() {
        self.setupHandle()
    }
    func setupHandle() {
        //
    }
    /// 加载内容
    func loadContent() {
        self.loadFirstContent()
        self.loadSecondContent()
        self.loadThirdContent()
        self.loadFourthContent()
        self.loadFifthContent()
    }
    func updateDataSource(at index: Int, with content: String) {
        if index >= 0 && index < self.dataSource.count {
            self.dataSource[index] = content
        }
    }
}
extension HomeViewModel {
    /// 加载第一个模块
    fileprivate func loadFirstContent() {
        ObjectApi.requestFirstObject().then { result -> Void in
            self.updateDataSource(at: 0, with: result)
            self.loadFirstObserver.send(value: true)
        }.catch { error in
            self.updateDataSource(at: 0, with: "A加载失败")
            self.loadFirstObserver.send(value: false)
        }
    }
}
extension HomeViewModel {
    /// 加载第二个模块
    fileprivate func loadSecondContent() {
        ObjectApi.requestSecondObject().then { result -> Void in
            self.updateDataSource(at: 1, with: result)
            self.loadSecondObserver.send(value: true)
            }.catch { error in
                self.updateDataSource(at: 1, with: "B加载失败")
                self.loadSecondObserver.send(value: false)
        }
    }
}
extension HomeViewModel {
    /// 加载第三个模块
    fileprivate func loadThirdContent() {
        ObjectApi.requestThirdObject().then { result -> Void in
            self.updateDataSource(at: 2, with: result)
            self.loadThirdObserver.send(value: true)
            }.catch { error in
                self.updateDataSource(at: 2, with: "C加载失败")
                self.loadThirdObserver.send(value: false)
        }
    }
}
extension HomeViewModel {
    /// 加载第四个模块
    fileprivate func loadFourthContent() {
        ObjectApi.requestFourthObject().then { result -> Void in
            self.updateDataSource(at: 3, with: result)
            self.loadFourthObserver.send(value: true)
            }.catch { error in
                self.updateDataSource(at: 3, with: "D加载失败")
                self.loadFourthObserver.send(value: false)
        }
    }
}
extension HomeViewModel {
    /// 加载第五个模块
    fileprivate func loadFifthContent() {
        ObjectApi.requestFifthObject().then { result -> Void in
            self.updateDataSource(at: 4, with: result)
            self.loadFifthObserver.send(value: true)
            }.catch { error in
                self.updateDataSource(at: 4, with: "E加载失败")
                self.loadFifthObserver.send(value: false)
        }
    }
}
