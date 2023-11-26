//
//  AnimationConfig.swift
//  Animation Curves And Timing
//
//  Created by Bambang Tri Rahmat Doni on 26/11/23.
//

import SwiftUI

struct AnimationConfig: Identifiable, Hashable {
    let id = UUID()
    
    let animation: Animation
    let description: String
}

extension AnimationConfig {
    static let standard = AnimationConfig(animation: .default, description: "Default")
    
    static let options: [AnimationConfig] = [
        AnimationConfig(animation: .linear, description: "Linear"),
        AnimationConfig(animation: .easeInOut, description: "EaseInOut"),
        AnimationConfig(animation: .easeIn, description: "EaseIn"),
        AnimationConfig(animation: .easeOut, description: "EaseOut"),
        
        AnimationConfig(animation: .linear(duration: 1.5), description: "Linear Dr 1.5"),
        AnimationConfig(animation: .easeInOut(duration: 1.5), description: "EaseInOut Dr 1.5"),
        AnimationConfig(animation: .easeIn(duration: 1.5), description: "EaseIn Dr 1.5"),
        AnimationConfig(animation: .easeOut(duration: 1.5), description: "EaseOut Dr 1.5"),
        
        AnimationConfig(animation: .linear(duration: 1.5).delay(0.5), description: "Linear Dr 1.5 Dl 0.5"),
        AnimationConfig(animation: .easeInOut(duration: 1.5).delay(0.5), description: "EaseInOut Dr 1.5 Dl 0.5"),
        AnimationConfig(animation: .easeIn(duration: 1.5).delay(0.5), description: "EaseIn Dr 1.5 Dl 0.5"),
        AnimationConfig(animation: .easeOut(duration: 1.5).delay(0.5), description: "EaseOut Dr 1.5 Dl 0.5"),
        
        AnimationConfig(animation: .timingCurve(0.14, 0.72, 0.65, 0.38,
                                                duration: 1.0), 
                        description: "Custom Bezier Curve"),
    ]
}
