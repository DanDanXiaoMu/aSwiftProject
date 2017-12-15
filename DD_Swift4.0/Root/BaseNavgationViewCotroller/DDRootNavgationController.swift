//
//  DDRootNavgationController.swift
//  Demo
//
//  Created by DDCJ_XiaoZhu on 2017/11/13.
//  Copyright © 2017年 DDCJ_XiaoZhu. All rights reserved.
//

import UIKit

class DDRootNavgationController: UINavigationController , UIGestureRecognizerDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        self.interactivePopGestureRecognizer?.delegate = self
    }
    override func viewSafeAreaInsetsDidChange() {
        
    }
    // 重写导航栏push方法  。。。去设置所有的导航栏按钮为统一样式
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        let rootView = viewController.view
        
        rootView?.frame = CGRect(x: (rootView?.safeAreaInsets.left)!, y: (rootView?.safeAreaInsets.top)!, width: width - (rootView?.safeAreaInsets.left)! - (rootView?.safeAreaInsets.right)!, height: height - (rootView?.safeAreaInsets.bottom)!)

        if self.childViewControllers.count > 0 {
            let  but = UIButton(type: .custom)
            but .setTitle("返回", for: .normal)
            but .setTitleColor(UIColor.black, for: .normal)
            but .setTitleColor(UIColor.red, for: .highlighted)
            but.sizeToFit()
            but.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
            but.addTarget(self, action:  Selector(("Back")), for: .touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: but)
        }
        super.pushViewController(viewController, animated: true)
    }
    
    
    func Back()
    {
        self .popViewController(animated: true)
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.childViewControllers.count > 1;
    }

}
