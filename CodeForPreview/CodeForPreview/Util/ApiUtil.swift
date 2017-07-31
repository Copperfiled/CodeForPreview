//
//  ApiUtil.swift
//  CodeForPreview
//
//  Created by guanxiaobai on 31/07/2017.
//  Copyright © 2017 guanxiaobai. All rights reserved.
//

// 网络请求统一接口
import Foundation
import Alamofire
import SwiftyJSON

class ApiUtil {
    static let DefaultParamEncoding: ApiUtil.ParamEncoding = .json
    
    static var DefaultHeaders: HTTPHeaders = [:]
    
    enum ParamEncoding {
        case json
        case url
        case plist
        func value() -> ParameterEncoding {
            switch self {
            case .json:
                return JSONEncoding()
            case .url:
                return URLEncoding()
            case .plist:
                return PropertyListEncoding()
            }
        }
    }
    
    fileprivate static var defaultJsonHeaders = ["Accept": "application/json"]
    
    class func request(_ method: HTTPMethod, _ url: URLConvertible, headers: HTTPHeaders? = nil, parameters: [String: Any]? = nil, encoding: ParameterEncoding? = nil, handler: ((AnyObject?, ApiError?) -> Void)? = nil) -> Alamofire.DataRequest {
        
        let en = encoding ?? ApiUtil.DefaultParamEncoding.value()
        
        var newHeaders: HTTPHeaders = ApiUtil.DefaultHeaders
        if headers != nil {
            for (name, value) in headers! {
                newHeaders[name] = value
            }
        }
        
        let request = Alamofire.request(url, method: method, parameters: parameters, encoding: en, headers: newHeaders).responseJSON { response in
            if response.result.isSuccess {
                debugPrint("----------------------------------")
                debugPrint("response:")
                debugPrint(response.response as Any)
                if let handle = handler {
                    if response.response!.statusCode / 100 == 2 {
                        handle((response.result.value ?? "") as AnyObject, nil)
                    } else {
                        let json = JSON(response.result.value ?? "")
                        var apiError = ApiError(response.response!.statusCode, json["code"].intValue, json["message"].stringValue)
                        if let reqid = response.response!.allHeaderFields["X-Reqid"] as? String {
                            apiError.reqid = reqid
                        }
                        
                        debugPrint("error:")
                        debugPrint(apiError)
                        
                        handle(nil, apiError)
                    }
                }
            } else {
                debugPrint("----------------------------------")
                debugPrint("error:")
                debugPrint(response.result.error as Any)
                
                if let handle = handler {
                    handle(nil, ApiError(0, 0, "", error: response.result.error))
                }
            }
        }
        debugPrint("==================================")
        debugPrint("request:")
        debugPrint(request)
        
        return request
    }
    
    class func requestJson(_ method: HTTPMethod, _ url: URLConvertible, headers: HTTPHeaders? = nil, parameters: [String: Any]? = nil, encoding: ApiUtil.ParamEncoding? = nil, handler: ((JSON?, ApiError?) -> Void)? = nil) -> Alamofire.DataRequest {
        
        var newHeaders: HTTPHeaders = [:]
        if headers != nil {
            for (name, value) in headers! {
                newHeaders[name] = value
            }
        }
        for (name, value) in defaultJsonHeaders {
            if newHeaders[name] == nil {
                newHeaders[name] = value
            }
        }
        
        let en = encoding?.value() ?? ApiUtil.DefaultParamEncoding.value()
        
        return self.request(method, url, headers: newHeaders, parameters: parameters, encoding: en) { data, error in
            guard let handle = handler else {
                return
            }
            if error != nil {
                handle(nil, error)
                return
            }
            handle(JSON(data!), nil)
        }
    }
}
