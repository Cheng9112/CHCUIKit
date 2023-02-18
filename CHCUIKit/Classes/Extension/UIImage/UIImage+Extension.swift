//
//  UIImage+Extension.swift
//  Swift-Extension
//
//  Created by cheng on 2020/12/14.
//

import UIKit
import AVFoundation

// MARK: 生成圆角图片
public extension UIImage {
    
    /// 生成圆角图片
    /// - Parameters:
    ///     - byRoundingCorners:哪些角需要圆角
    ///     - cornerRadi:圆角率
    func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadi: CGFloat) -> UIImage? {
        return roundImage(byRoundingCorners: byRoundingCorners, cornerRadii: CGSize(width: cornerRadi, height: cornerRadi))
    }
    
    func roundImage(byRoundingCorners: UIRectCorner = UIRectCorner.allCorners, cornerRadii: CGSize) -> UIImage? {
        
        let imageRect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        guard context != nil else {
            return nil
        }
        context?.setShouldAntialias(true)
        let bezierPath = UIBezierPath(roundedRect: imageRect,
                                      byRoundingCorners: byRoundingCorners,
                                      cornerRadii: cornerRadii)
        bezierPath.close()
        bezierPath.addClip()
        self.draw(in: imageRect)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

// MARK: 修改图片颜色/根据颜色生成图片/生成渐变色图片
public extension UIImage {
    /// 修改图片的颜色
    func image(withColor color:UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        let context = UIGraphicsGetCurrentContext()
        context?.ctm.translatedBy(x: 0, y: size.height)
        context?.ctm.scaledBy(x: 1.0, y: -1.0)
        context?.setBlendMode(.normal)
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        context?.clip(to: rect, mask: cgImage!)
        color.setFill()
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
    /// 根据颜色生成图片
    class func image(withColor color:UIColor, size:CGSize) -> UIImage? {
        if size.width <= 0, size.height <= 0 {
            return nil
        }
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 生成渐变色图片
    class func image(withColors colors:[UIColor], size:CGSize) -> UIImage? {
        var gradientColors:[CGColor] = []
        gradientColors = colors.map({ (color) in
            return color.cgColor
        })
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: gradientColors as CFArray, locations: nil)
        let startPoint = CGPoint(x: 0, y: 0)
        let endPoint = CGPoint(x: size.width, y: size.height)
        context?.drawLinearGradient(gradient!, start: startPoint, end: endPoint, options: .drawsBeforeStartLocation)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

// MARK: 调整图片的尺寸
extension UIImage {

    /// 根据目标尺寸重绘图片
    public func resizedImage(size: CGSize) -> UIImage {
        let newRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        if let cgImg = self.cgImage {
            var newImage: UIImage!
            UIGraphicsBeginImageContext(newRect.size)
            newImage = UIImage(cgImage: cgImg, scale: 1, orientation: self.imageOrientation)
            newImage.draw(in: newRect)
            newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return newImage
        }
        return self
    }

    /// 根据给定的Size的宽高比裁剪图片中间位置
    public static func croppingImage(originalImg: CGImage, bySize: CGSize) -> CGImage? {
            
        let imgWidth = CGFloat(originalImg.width)
        let imgHeight = CGFloat(originalImg.height)
        
        // 图片宽高比小于目标宽高比时，以图片宽度为宽截取跟目标等比例的高，取中间位置
        if imgWidth / imgHeight <= bySize.width / bySize.height {
            
            let width = imgWidth
            let height = imgWidth * bySize.height / bySize.width
            let newCgImg = originalImg.cropping(to: CGRect(x: 0, y: (imgHeight - height) / 2, width: width, height: height))
            return newCgImg
            
        } else {
            
            let width = imgHeight * bySize.width / bySize.height
            let height = imgHeight
            let newCgImg = originalImg.cropping(to: CGRect(x: (imgWidth-width) / 2, y: 0, width: width, height: height))
            return newCgImg
        }
    }
}

// MARK: 压缩图片
extension UIImage {
    
    /// 根据最大尺寸压缩图片，返回UIImage
    public func compressImage(boundary: CGFloat) -> UIImage? {
        
        if let imageData = compressImageToData(boundary: boundary) {
        
            return UIImage.init(data: imageData)
        }
        return nil
    }
    
    /// 根据最大尺寸压缩图片，返回Data
    public func compressImageToData(boundary: CGFloat) -> Data? {
        let size = self.imageSizeMode(boundary: boundary)
        let reImage = resizedImage(size: size)
        let data = reImage.jpegData(compressionQuality: 1)!
        return data
    }
    
    /// 压缩图片尺寸
    private func imageSizeMode(boundary: CGFloat) -> CGSize {
        var width = self.size.width
        var height = self.size.height
                
        guard width > boundary || height > boundary else {
            return CGSize(width: width, height: height)
        }
        
        let scale = max(width, height) / min(width, height)
        if scale <= 2 {
            let x = max(width, height) / boundary
            if width > height {
                width = boundary
                height = height / x
            } else {
                height = boundary
                width = width / x
            }
        } else {

            if min(width, height) >= boundary {
                
                let x = min(width, height) / boundary
                if width < height {
                    width = boundary
                    height = height / x
                } else {
                    height = boundary
                    width = width / x
                }
            }
        }
        return CGSize(width: width, height: height)
    }
}
