//
//  CommonMacro.swift
//  Capture
//
//  Created by yinhao on 2023/9/16.
//

import Foundation
import UIKit

// 展示toast
func showTextToast(_ text: String) {
    let window = UIApplication
                .shared
                .connectedScenes
                .compactMap { ($0 as? UIWindowScene)?.keyWindow }
                .first
    let toast = UILabel()
    toast.text = text
    toast.textColor = UIColor.white
    toast.textAlignment = .center
    toast.font = UIFont.systemFont(ofSize: 14)
    toast.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    toast.layer.cornerRadius = 5
    toast.layer.masksToBounds = true
    toast.numberOfLines = 0
    window?.addSubview(toast)
    // 计算frame
    let size = toast.sizeThatFits(CGSize(width: UIScreen.main.bounds.width - 40, height: CGFloat(MAXFLOAT)))
    toast.frame = CGRect(x: (UIScreen.main.bounds.width - size.width - 20) / 2, y: UIScreen.main.bounds.height - size.height - 100, width: size.width + 20, height: size.height + 20)

    toast.alpha = 0
    UIView.animate(withDuration: 0.3) {
        toast.alpha = 1
    } completion: { (finished) in
        UIView.animate(withDuration: 0.3, delay: 1.5) {
            toast.alpha = 0
        } completion: { (finished) in
            toast.removeFromSuperview()
        }
    }
}
