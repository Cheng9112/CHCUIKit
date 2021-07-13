//
//  HCToolConst.swift
//  CHCUIKit
//
//  Created by Cheng on 2021/7/1.
//

import Foundation

/// 版本号
public let APP_VERSION: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
/// Build号
public let APP_BUILD: String = Bundle.main.infoDictionary?["CFBundleVersion"] as? String ?? ""
