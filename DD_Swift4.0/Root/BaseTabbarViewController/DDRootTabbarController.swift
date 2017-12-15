//
//  DDRootTabbarController.swift
//  Demo
//
//  Created by DDCJ_XiaoZhu on 2017/11/13.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit

class DDRootTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AddchildS(VC: DDBaseViewController(), title: "首页", image: "首页", selectIameg: "sele_首页")
    }
    
    func AddchildS(VC:UIViewController , title :String ,image :String ,selectIameg :String)
    {
        /// 加上导航控制器
        let nav = DDRootNavgationController(rootViewController: VC)
        nav.tabBarItem = UITabBarItem(title: title, image:UIImage(named:image), selectedImage: UIImage(named:selectIameg))
        addChildViewController(nav)
        
    }
 
}

