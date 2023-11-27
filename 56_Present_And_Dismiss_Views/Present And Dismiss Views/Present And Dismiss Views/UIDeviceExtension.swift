//
//  UIDeviceExtension.swift
//  Present And Dismiss Views
//
//  Created by Bambang Tri Rahmat Doni on 27/11/23.
//

import UIKit

extension UIDevice {
    static var deviceHasNotch: Bool {
        let bottomInsets = keyWindow?.safeAreaInsets.bottom ?? 0.0
        return bottomInsets > 0
    }
    
    private static var keyWindow: UIWindow? {
        // Get connected scenes
        //
        return UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first(where: { $0 is UIWindowScene })
            .flatMap({ $0 as? UIWindowScene })?.windows
            .first(where: \.isKeyWindow)
    }
}
