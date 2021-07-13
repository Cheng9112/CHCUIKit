//
//  NSObject+ToolExtension.swift
//  CHCUIKit
//
//  Created by Cheng on 2021/7/1.
//

import UIKit

public extension NSObject {
    
    /// 移除通知
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    /// 移除通知
    /// - Parameter name: 通知名
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }

    /// 添加通知
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
    
    ///获取当前正在显示的ViewController
    @objc class func currentViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return currentViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            return currentViewController(base: tab.selectedViewController)
        }
        if let presented = base?.presentedViewController {
            return currentViewController(base: presented)
        }
        return base
    }
}
