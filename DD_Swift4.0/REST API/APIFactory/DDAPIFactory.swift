//
//  DDAPIFactory.swift
//  Demo
//
//  Created by DDCJ_XiaoZhu on 2017/11/13.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit
import MJExtension
/*
 这个文件是用来放所以你需要用的一些API接口的
 也就是用来放所以的你用于网络请求的一些接口
 */
var pageNumber = "1"
var pageSize = "10"
var ModelMeArr : [joke] = [joke]()
class DDAPIFactory: NSObject{
    /*这个方法是在外界调用，  我们把一些固定的不要修改的参数放到这里，然后通过这个方法我们可以传入一个动态的字典，这个动态字典是存放外界传过来的参数，这样代码看起来会跟整洁*/
    class func requestJokeData(URLString : String, dynamicParameters : [String : Any]? = nil, finishedCallback :  @escaping ([joke]) -> ()){
        var dic = [String:String]()
        for (key, value) in dynamicParameters! {
            dic[key] = value as? String
        }
        dic.updateValue(getTimeChuo(), forKey: "time")
        dic.updateValue(myKey, forKey: "key")
        NetworkTools.requestData(.get, URLString: URLString, parameters: dic) { (response) in
            guard let dic = response.json_Result as? [String : NSObject] else {return}
            guard let dataArr = dic["data"] as? [NSObject] else {return}
            for dic in dataArr{
                let jsonString = toJSONString(dict: dic as! NSDictionary) as String
                var xiaomin : joke
                do {
                    xiaomin = try JSONDecoder().decode(joke.self, from: jsonString.data(using: .utf8)!)
                    ModelMeArr.append(xiaomin)
                    print(xiaomin.content)
                } catch {
                    // 异常处理
                    print("解析失败")
                }
            }
            finishedCallback(ModelMeArr)
        }
       
    }
}


