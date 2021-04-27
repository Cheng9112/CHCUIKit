//
//  UIViewController+Extension.swift
//  Swift-Extension
//
//  Created by cheng on 2020/12/14.
//

import UIKit

public extension UIViewController {
    
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }

    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self, name: name, object: nil)
    }

    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self, selector: selector, name: name, object: nil)
    }
}

public extension UIViewController {
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
