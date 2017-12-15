//
//  DDBaseViewController.swift
//  Demo
//
//  Created by DDCJ_XiaoZhu on 2017/11/13.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit
import MJExtension
class DDBaseViewController: UIViewController {
    
    var pageNumber = "1"
    var pageSize = "10"
    lazy var ModelMeArr : [joke] = [joke]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "首页"
        loadData(pageNumber:pageNumber, pageSize:pageSize)
    }
    func installUI()  {
        let baseView = DDBaseView(frame: CGRect(x: 0, y: 0, width: width, height: height), currentVC: self,modelArr:ModelMeArr)
        view.addSubview(baseView)
    }
}
extension DDBaseViewController{
    func loadData(pageNumber : String , pageSize : String){
        var dic = [String:String]()
        dic .updateValue(String(describing: sortType.sort.desc), forKey: "sort")
        dic.updateValue(pageNumber, forKey: "page")
        dic.updateValue(pageSize, forKey: "pagesize")
        dic.updateValue(getTimeChuo(), forKey: "time")
        DDAPIFactory.requestJokeData(URLString: messegURL, dynamicParameters: dic) { (modelArr) in
            self.ModelMeArr = modelArr
            // 当数据加载完成去加载UI界面，为了防止没有数据尔加载出来UI界面。
            self.installUI()
        }
    }
}
