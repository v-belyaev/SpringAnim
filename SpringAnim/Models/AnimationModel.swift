//
//  AnimationModel.swift
//  SpringAnim
//
//  Created by Владимир Беляев on 10.01.2021.
//

import Spring

class AnimationModel {
    private(set) var nextAnimationName: String
    private(set) var currentAnimationName: String
    private(set) var curve: String
    private(set) var duration: CGFloat
    private(set) var force: CGFloat
    
    init() {
        nextAnimationName = AnimationPreset.allCases.randomElement()!.rawValue
        currentAnimationName = AnimationPreset.allCases.randomElement()!.rawValue
        curve = AnimationCurve.allCases.randomElement()!.rawValue
        duration = .random(in: 0.3...0.9)
        force = .random(in: 0.1...2)
    }
    
    func update() {
        currentAnimationName = nextAnimationName
        nextAnimationName = AnimationPreset.allCases.randomElement()!.rawValue
        curve = AnimationCurve.allCases.randomElement()!.rawValue
        duration = .random(in: 0.3...0.9)
        force = .random(in: 0.1...2)
    }
}

// MARK: - Internal types
extension AnimationModel {
    enum AnimationPreset: String, CaseIterable {
        case slideLeft
        case slideRight
        case slideDown
        case slideUp
        case squeezeLeft
        case squeezeRight
        case squeezeDown
        case squeezeUp
        case fadeIn
        case fadeOut
        case fadeOutIn
        case fadeInLeft
        case fadeInRight
        case fadeInDown
        case fadeInUp
        case zoomIn
        case zoomOut
        case fall
        case shake
        case pop
        case flipX
        case flipY
        case morph
        case squeeze
        case flash
        case wobble
        case swing
    }
    
    enum AnimationCurve: String, CaseIterable {
        case easeIn
        case easeOut
        case easeInOut
        case linear
        case spring
        case easeInSine
        case easeOutSine
        case easeInOutSine
        case easeInQuad
        case easeOutQuad
        case easeInOutQuad
        case easeInCubic
        case easeOutCubic
        case easeInOutCubic
        case easeInQuart
        case easeOutQuart
        case easeInOutQuart
        case easeInQuint
        case easeOutQuint
        case easeInOutQuint
        case easeInExpo
        case easeOutExpo
        case easeInOutExpo
        case easeInCirc
        case easeOutCirc
        case easeInOutCirc
        case easeInBack
        case easeOutBack
        case easeInOutBack
    }
}
