//
//  Result.swift
//  DD_Swift4.0
//
//  Created by DDCJ_XiaoZhu on 2017/12/14.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit
import Foundation

//typealias ResponseSuccessResult = (Response) -> ()
//typealias ResponseSuccessArray = ([NSObject]) -> ()
//typealias ResponseSuccessDictionary = ([String : NSObject]) -> ()
//typealias ResponseFailure = (NSError) -> ()
//typealias ResponseFail = (NSError,String) -> ()

class Response: NSObject {
    var error_code : Int = 0
    var json_reason : String!
    var json_Result : NSObject!
    
    
    
     func insertDic(dic:[String : NSObject]) -> Response {
        let code : Int = dic["error_code"] as! Int
        let reason : String = dic["reason"] as! String
        let result : [String : NSObject] = dic["result"] as! [String : NSObject]
        return initResponse(errorCode: code, jsonReason: reason, jsonResult: result as NSObject)
    }
    func initResponse(errorCode : Int , jsonReason : String , jsonResult : NSObject) -> Response {
        error_code = errorCode
        json_reason = jsonReason
        json_Result = jsonResult
        return self
    }
}

