//
//  LQGNoTargetActionController.swift
//  LQGNoTargetAction
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

import Foundation
import LQGCategory
import LQGTip

@objcMembers public class LQGNoTargetActionController: LQGBaseViewController {
    
    //MARK: - NavigationBar
    
    override public func lqg_setupNavigationBarItem() {
        self.title = "404 Not Found";
    }
    
    //MARK: - 属性
    
    public var params: NSDictionary?
    
    //MARK: - Life Cycle
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        LQGDefaultView.show(with: {
            let model = LQGDefaultViewModel.init()
            model.image = UIImage.init(named: "icon_default_error", bundleFor: LQGDefaultView.self, urlForResource: "LQGTip")
            model.message = {
                var message = "获取路由失败"
#if DEBUG
                message += String.init(format: "，请检查路由配置:\n%@", self.params!)
#endif
                return message
            }()
            return model
        }(), to: self.view)
    }
}
