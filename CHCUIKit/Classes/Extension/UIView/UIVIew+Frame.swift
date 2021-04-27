//
//  UIVIew+Frame.swift
//  CHCUIKit
//
//  Created by laihuaiOS on 2021/4/27.
//

import Foundation

extension UIView {
    
    //获取视图的X坐标
    public var X:CGFloat{
        get{
            return self.frame.origin.x;
        }
        
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的Y坐标
    public var Y:CGFloat{
        get{
            return self.frame.origin.y;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取origin
    public var origin: CGPoint {
        get {
            return self.frame.origin
        }
        
        set {
            self.frame.origin = newValue
        }
    }
    
    //获取size
    public var size: CGSize {
        get {
            return self.frame.size
        }
        
        set {
            self.frame.size = newValue
        }
    }
    
    //获取视图的宽
    public var width:CGFloat{
        get{
            return self.frame.size.width;
        }
        
        set{
            var frames = self.frame;
            frames.size.width = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取视图的高
    public var height:CGFloat{
        get{
            return self.frame.size.height;
        }
        
        set{
            var frames = self.frame;
            frames.size.height = CGFloat(newValue);
            self.frame = frames;
        }
    }
    
    //获取最大的X坐标
    public var maxX:CGFloat{
        get{
            return self.X + self.width;
        }
        
        set{
            var frames = self.frame;
            frames.origin.x = CGFloat(newValue - self.width);
            self.frame = frames;
        }
    }
    
    //获取最大的Y坐标
    public var maxY:CGFloat{
        get{
            return self.Y + self.height;
        }
        
        set{
            var frames = self.frame;
            frames.origin.y = CGFloat(newValue - self.height);
            self.frame = frames;
        }
    }
    
    //中心点X坐标
    public var centerX:CGFloat{
        get{
            return self.center.x;
        }
        set{
            self.center = CGPoint(x:CGFloat(newValue),y:self.center.y);
        }
    }
    
    //中心点Y坐标
    public var centerY:CGFloat{
        get{
            return self.center.y;
        }
        set{
            self.center = CGPoint(x:self.center.x,y:CGFloat(newValue));
        }
    }
    
}
