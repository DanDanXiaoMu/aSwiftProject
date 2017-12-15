//
//  NetworkTools.swift
//  HttpRequest
//
//  Created by JIN on 2017/6/22.
//  Copyright © 2017年 JIN. All rights reserved.
//

import UIKit
import Alamofire

enum MethodType {
    case get
    case post
}

class NetworkTools {
    class func requestData(_ type : MethodType, URLString : String, parameters : [String : Any]? = nil, finishedCallback :  @escaping (Response) -> ()){
        // 1.获取类型
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        // 2.发送网络请求
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON { (response) in
            // 3.获取结果
            guard let result = response.result.value else {return}
            guard let resultDict = result as? [String : NSObject] else { return }
            let response = Response().insertDic(dic: resultDict)
            if response.error_code == 0{
                print("请求成功")
            }else{
                print("服务器请求错误!")
            }
            // 4.将结果回调出去
            finishedCallback(response)
        }
    }
}

