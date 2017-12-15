//
//  MyTableViewCell.swift
//  DD_Swift4.0
//
//  Created by DDCJ_XiaoZhu on 2017/12/13.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var titlle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
     var xiaomin : joke? {
        didSet {
            // 1.将属性传递给父类
            self.titlle.text = xiaomin!.content
            self.time.text = xiaomin!.updatetime
            // 2.所在的城市
        }
    }
}
