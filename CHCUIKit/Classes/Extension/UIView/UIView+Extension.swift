//
//  UIView+Extension.swift
//  Swift-Extension
//
//  Created by cheng on 2020/12/14.
//

import UIKit

public extension UIView {
    /// 删除View所有的子视图
    func removeAllSubViews() {
        self.subviews.forEach { (view) in
            view.removeFromSuperview()
        }
    }
    
    /// 删除View的所有手势
    func removeGestureRecognizers() {
        gestureRecognizers?.forEach(removeGestureRecognizer)
    }
    
    /// 获取View所属的控制器
    func viewController () -> UIViewController? {
        weak var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    /// 快捷添加点击事件
    func addTap(target: Any? , action: Selector?) {
        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: target, action: action)
        self.addGestureRecognizer(tap)
    }
    
    /// 加载nib
    class func loadFromNib(named name: String, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: name, bundle: bundle).instantiate(withOwner: nil, options: nil)[0] as? UIView
    }
}

public extension UIView {
    
    /// 设置一个或多个角为圆角
    /// - Parameters:
    ///   - corners: array of corners to change (example: [.bottomLeft, .topRight]).
    ///   - radius: radius for selected corners.
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))
        
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }

    /// 设置阴影
    ///
    /// - Parameters:
    ///   - color: shadow color (default is #137992).
    ///   - radius: shadow radius (default is 3).
    ///   - offset: shadow offset (default is .zero).
    ///   - opacity: shadow opacity (default is 0.5).
    func addShadow(ofColor color: UIColor = UIColor(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0), radius: CGFloat = 3, offset: CGSize = .zero, opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}

// MARK: 截取UIView为图片
public extension UIView {
    
    /// 获取UIView的截屏，生成UIImage
    class func screenshot(ofView view:UIView) -> UIImage? {
        if view.frame == CGRect.zero {
            return nil
        }
        UIGraphicsBeginImageContextWithOptions(view.frame.size, true, 0)
        if view.responds(to: #selector(drawHierarchy(in:afterScreenUpdates:))) {
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        } else {
            if let context = UIGraphicsGetCurrentContext() {
                view.layer .render(in: context)
            } else {
                return nil
            }
        }
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
