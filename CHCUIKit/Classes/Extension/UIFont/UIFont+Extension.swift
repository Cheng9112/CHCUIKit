//
//  UIFont+Extension.swift
//  HCDesignKit
//
//  Created by Cheng on 2021/8/24.
//

import UIKit

public extension UIFont {
    
    static let designKit = DesignKitTypography()
    struct DesignKitTypography {
        public var display1: UIFont {
            .systemFont(ofSize: 42, weight: .medium)
        }
        public var display2: UIFont {
            .systemFont(ofSize: 36, weight: .medium)
        }
        public var title1: UIFont {
            .systemFont(ofSize: 24, weight: .medium)
        }
        public var title2: UIFont {
            .systemFont(ofSize: 20, weight: .medium)
        }
        public var title3: UIFont {
            .systemFont(ofSize: 18, weight: .medium)
        }
        public var title4: UIFont {
            .systemFont(ofSize: 14, weight: .medium)
        }
        public var title5: UIFont {
            .systemFont(ofSize: 12, weight: .medium)
        }
        public var bodyBold: UIFont {
            .systemFont(ofSize: 16, weight: .semibold)
        }
        public var body: UIFont {
            .systemFont(ofSize: 16, weight: .light)
        }
        public var captionBold: UIFont {
            .systemFont(ofSize: 14, weight: .medium)
        }
        public var caption: UIFont {
            .systemFont(ofSize: 14, weight: .light)
        }
        public var small: UIFont {
            .systemFont(ofSize: 12, weight: .light)
        }
    }
}
