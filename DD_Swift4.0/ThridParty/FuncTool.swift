//
//  FuncTool.swift
//  DD_Swift4.0
//
//  Created by DDCJ_XiaoZhu on 2017/12/14.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit

class FuncTool: NSObject {

}
// 把一个字典转为一个Json字符串
func toJSONString(dict:NSDictionary!)->NSString{
    if (!JSONSerialization.isValidJSONObject(dict)) {
        print("无法解析出JSONString")
        return ""
    }
    let data : NSData! = try? JSONSerialization.data(withJSONObject: dict, options: []) as NSData!
    let JSONString = NSString(data:data as Data,encoding: String.Encoding.utf8.rawValue)
    return JSONString!
}
// 得到当前的时间戳
func getTimeChuo() ->String {
    //获取当前时间
    let now = Date()
    // 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
    print("当前日期时间：\(dformatter.string(from: now))")
    //当前时间的时间戳
    let timeInterval:TimeInterval = now.timeIntervalSince1970
    let timeStamp = Int(timeInterval)
    print("当前时间的时间戳：\(timeStamp)")
    let fininalSring = "\(timeStamp)"
    return fininalSring
}
