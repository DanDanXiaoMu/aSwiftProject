//
//  Model.swift
//  DD_Swift4.0
//
//  Created by DDCJ_XiaoZhu on 2017/12/15.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit

struct joke : Decodable {
    var content : String
    var hashId : String
    var unixtime : Int = 0
    var updatetime : String
}



