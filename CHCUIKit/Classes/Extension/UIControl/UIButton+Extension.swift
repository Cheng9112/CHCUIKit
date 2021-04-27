//
//  UIButton+Extension.swift
//  Swift-Extension
//
//  Created by cheng on 2020/12/14.
//

import UIKit

public enum HCButtonEdgeInsetsStyle {
    case top    //image在上，label在下
    case left   //image在左，label在右
    case bottom //image在下，label在上
    case right  //image在右，label在左
}

public extension UIButton {
    
    /// 调整图片与文字的位置
    /// - Parameters:
    ///     - style:图片与文字的位置enum
    ///     - space:图片与文字的间距
    func layoutButton(style: HCButtonEdgeInsetsStyle, space:CGFloat) {
        
        // 1. 得到imageView和titleLabel的宽、高
        let imageWith = imageView!.frame.size.width
        let imageHeight = imageView!.frame.size.height
        var labelWidth:CGFloat = 0
        var labelHeight:CGFloat = 0
        labelWidth = titleLabel?.frame.size.width ?? 0
        labelHeight = titleLabel?.frame.size.height ?? 0
        
        
        // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
        var hc_ImageEdgeInsets = UIEdgeInsets.zero
        var hc_TitleEdgeInsets = UIEdgeInsets.zero
        
        // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
        switch style {
        case .top:
            hc_ImageEdgeInsets = UIEdgeInsets(top: -labelHeight-space/2.0, left: 0, bottom: 0, right: -labelWidth)
            hc_TitleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith, bottom: -imageHeight-space/2.0, right: 0)
        case .left:
            hc_ImageEdgeInsets = UIEdgeInsets(top: 0, left: -space/2.0, bottom: 0, right: space/2.0)
            hc_TitleEdgeInsets = UIEdgeInsets(top: 0, left: space/2.0, bottom: 0, right: -space/2.0)
        case .bottom:
            hc_ImageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -labelHeight-space/2.0, right: -labelWidth)
            hc_TitleEdgeInsets = UIEdgeInsets(top: -imageHeight-space/2.0, left: -imageWith, bottom: 0, right: 0)
        case .right:
            hc_ImageEdgeInsets = UIEdgeInsets(top: 0, left: labelWidth+space/2.0, bottom: 0, right: -labelWidth-space/2.0)
            hc_TitleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWith-space/2.0, bottom: 0, right: imageWith+space/2.0)
        }
        
        // 4. 赋值
        titleEdgeInsets = hc_ImageEdgeInsets
        imageEdgeInsets = hc_TitleEdgeInsets
    }
}
