//
//  ObjectApi.swift
//  CodeForPreview
//
//  Created by guanxiaobai on 31/07/2017.
//  Copyright © 2017 guanxiaobai. All rights reserved.
//

import Foundation
import PromiseKit

let url = "io.zaojiu.com/api/live/config"
class ObjectApi {
    
    /// 加载第一个模块
    ///
    /// - Returns: 模拟数据
    static func requestFirstObject() -> Promise<String> {
        return Promise { resolve, reject in
            let _ = ApiUtil.requestJson(.get, url, handler: { (json, error) in
                if let err = error {
                    reject(err)
                    return
                }
                guard let json = json else {
                    return
                }
                
                print(json)
                resolve("第一个模块加载成功")
            })
        }
    }
}
extension ObjectApi {
    /// 加载第二个模块
    ///
    /// - Returns: 模拟数据
    static func requestSecondObject() -> Promise<String> {
        return Promise { resolve, reject in
            let newUrl = "https://" + url
            let _ = ApiUtil.requestJson(.get, newUrl, handler: { (json, error) in
                if let err = error {
                    reject(err)
                    return
                }
                guard let json = json else {
                    return
                }
                
                print(json)
                resolve("第二个模块加载成功")
            })
        }
    }
}
extension ObjectApi {
    /// 加载第三个模块
    ///
    /// - Returns: 模拟数据
    static func requestThirdObject() -> Promise<String> {
        return Promise { resolve, reject in
            let _ = ApiUtil.requestJson(.get, url, handler: { (json, error) in
                if let err = error {
                    reject(err)
                    return
                }
                guard let json = json else {
                    return
                }
                
                print(json)
                resolve("第三个模块加载成功")
            })
        }
    }
}
extension ObjectApi {
    /// 加载第四个模块
    ///
    /// - Returns: 模拟数据
    static func requestFourthObject() -> Promise<String> {
        return Promise { resolve, reject in
            let newUrl = "https://" + url
            let _ = ApiUtil.requestJson(.get, newUrl, handler: { (json, error) in
                if let err = error {
                    reject(err)
                    return
                }
                guard let json = json else {
                    return
                }
                
                print(json)
                resolve("第四个模块加载成功")
            })
        }
    }
}
extension ObjectApi {
    /// 加载第五个模块
    ///
    /// - Returns: 模拟数据
    static func requestFifthObject() -> Promise<String> {
        return Promise { resolve, reject in
            let _ = ApiUtil.requestJson(.get, url, handler: { (json, error) in
                if let err = error {
                    reject(err)
                    return
                }
                guard let json = json else {
                    return
                }
                
                print(json)
                resolve("第五个模块加载成功")
            })
        }
    }
}
