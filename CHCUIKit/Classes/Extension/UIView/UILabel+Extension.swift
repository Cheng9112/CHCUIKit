//
//  UILabel+Extension.swift
//  Swift-Extension
//
//  Created by cheng on 2020/12/14.
//

import UIKit

public extension UILabel {
        
    /// 根据文本内容计算宽高且宽度不超过width(注意:需要在设置text后调用)
    func size(withWidth width:CGFloat) -> CGSize {
        
        guard let text = text, text.count > 0 else {

            return CGSize.zero
        }
        let options:NSStringDrawingOptions = [NSStringDrawingOptions.usesLineFragmentOrigin,
                                              NSStringDrawingOptions.usesFontLeading,//以字体的行高作为间距
                                              NSStringDrawingOptions.truncatesLastVisibleLine]//如果字符绘制不完呈现省略号
        let style = NSMutableParagraphStyle.init()
        style.lineBreakMode = .byCharWrapping
        let attributes:[NSAttributedString.Key:Any] = [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 15),
                                                       NSAttributedString.Key.paragraphStyle: style]
        let textStr:NSString = text as NSString
        let rect = textStr.boundingRect(with: CGSize(width: width, height: 3000),
                                        options: options,
                                        attributes: attributes,
                                        context: nil)
        return rect.size
    }
}
