//
//  ApiError.swift
//  CodeForPreview
//
//  Created by guanxiaobai on 31/07/2017.
//  Copyright © 2017 guanxiaobai. All rights reserved.
//

import Foundation

struct ApiError: Error {
    
    static let ErrNil                 = ApiError(0, 0, "")
    static let ErrNotFound            = ApiError(404, 404, "not found")
    static let ErrBadRequestBody      = ApiError(400, 400, "bad request")
    static let ErrNeedLogin           = ApiError(401, 401, "need login")
    static let ErrNoPermission        = ApiError(403, 403, "forbidden")
    
    static let ErrApiAuthInvalidHeader = ApiError(401, 20000, "authorization not in request headers")
    static let ErrApiAuthInvalidToken  = ApiError(401, 20001, "invalid token")
    static let ErrApiAuthInvalidType   = ApiError(401, 20002, "invalid auth type")
    static let ErrApiAuthInvalidInfo   = ApiError(401, 20003, "invalid auth info")
    static let ErrApiAuthExpiredToken  = ApiError(401, 20004, "expired token")
    static let ErrApiAuthUserNotFound  = ApiError(403, 20005, "user info not found")
    static let ErrApiAuthNeedSSL       = ApiError(403, 20006, "please access api with ssl")
    static let ErrApiAuthInActived     = ApiError(403, 20007, "inactived")
    static let ErrApiAuthCreateFailed  = ApiError(403, 20008, "token create failed")
    static let ErrAuthTypeNotSupport   = ApiError(403, 20100, "auth type not support")
    static let ErrAuthInfoWrong        = ApiError(403, 20101, "wrong auth info")
    static let ErrAuthCodeInvalid      = ApiError(403, 20102, "invalid auth code")
    static let ErrAuthTimesExceedLimit = ApiError(403, 20103, "auth times exceed limit")
    
    static let ErrPleaseWaitAMoment       = ApiError(403, 200200, "please wait a moment")
    static let ErrUserMobileAlreadyBinded = ApiError(400, 200201, "user mobile already binded")
    static let ErrUserMobileUsedByOthers  = ApiError(400, 200202, "user mobile used by others")
    
    static let ErrNeedToPay          = ApiError(403, 400001, "need to pay")
    static let ErrNoNeedToPay        = ApiError(400, 400002, "no need to pay")
    static let ErrUnknownPayPlatform = ApiError(400, 400003, "unknown pay platform")
    static let ErrOrderAlreadPaid    = ApiError(400, 400101, "order already paid")
    static let ErrOrderAlreadClosed  = ApiError(400, 400102, "order already closed")
    
    var status: Int = 0
    var code: Int = 0
    var message: String = ""
    var reqid: String = ""
    var error: Error? = nil
    
    
    
    init(_ status: Int, _ code: Int, _ message: String, reqid: String = "", error: Error? = nil) {
        self.status = status
        self.code = code
        self.message = message
        self.reqid = reqid
        self.error = error
    }
    
    init(_ message: String) {
        self.message = message
    }
}

extension ApiError: Equatable {
    static func == (lhs: ApiError, rhs: ApiError) -> Bool {
        return lhs.status == rhs.status && lhs.code == rhs.code
    }
}
