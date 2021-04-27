//
//  LHUIExtensionDefine.swift
//  LHUIExtension
//
//  Created by cheng on 2021/2/13.
//

import UIKit

public let mKeyWindow = UIApplication.shared.keyWindow

// ************ 屏幕尺寸 ************* //

/// iphone5/5s/SE
public let IPHONE5 = (mScreenHeight == 568 && mScreenWidth == 320) || (mScreenHeight == 320 && mScreenWidth == 568)

/// iphone6/7/8
public let IPHONE6 = (mScreenHeight == 667 && mScreenWidth == 375) || (mScreenHeight == 375 && mScreenWidth == 667)

/// iphone6p/7p/8p
public let IPHONE6P = (mScreenHeight == 736 && mScreenWidth == 414) || ((mScreenHeight == 414 && mScreenWidth == 736))

/// 相较于iPhone6宽度比率
public let iPhone6Scale = mScreenWidth / 375.0

/// iPhoneX/iPhoneXs
public let IPHONEX = (mScreenHeight == 812 && mScreenWidth == 375) || (mScreenHeight == 375 && mScreenWidth == 812)

/// iPhoneXR/iPhoneXs Max
public let IPHONEXS_Max = (mScreenHeight == 896 && mScreenWidth == 414) || (mScreenHeight == 414 && mScreenWidth == 896)

/// iPhone12mini
public let IPHONE12mini = (mScreenWidth == 360 && mScreenHeight == 780)

/// iPhone12 / iPhone12pro
public let IPHONE12 =  (mScreenWidth == 390 && mScreenHeight == 844)

/// iPhone12proMax
public let IPHONE12PROMax = (mScreenWidth == 428 && mScreenHeight == 926)

/// 全面屏系列：iPhoneX/iPhoneXR/iPhoneXs/iPhoneXs Max
public let IsAllScreen = (IPHONEX || IPHONEXS_Max || IPHONE12mini || IPHONE12 || IPHONE12PROMax)
///屏幕宽
public let mScreenWidth = min(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
///屏幕高
public let mScreenHeight = max(UIScreen.main.bounds.size.width, UIScreen.main.bounds.size.height)
/// 屏幕rect
public let mScreenRect = CGRect(x: 0, y: 0, width: mScreenWidth, height: mScreenHeight)
/// 状态栏高度
public let mStatusBarHeight: CGFloat = IsAllScreen ? 44.0 : 20.0
/// 导航栏高度
public let mNavBarHeight: CGFloat = 44.0
/// 导航栏+状态栏高度
public let mTopHeight = mStatusBarHeight + mNavBarHeight
/// 底部安全距离
public let mSafeBottomMargin: CGFloat = IsAllScreen ? 34 : 0
/// tabbar高度
public let mTabBarHeight: CGFloat = IsAllScreen ? 83 : 49


