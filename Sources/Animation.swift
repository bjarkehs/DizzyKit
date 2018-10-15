//
//  Animation.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

public protocol Animation {
    var changes: ChangeBlock? { get set}
    var completion: CompletionBlock? { get set }
    var duration: TimeInterval { get }
    var delay: TimeInterval { get }
    var animationOptions: UIView.AnimationOptions { get }
    
    func animate(view: UIView)
}

public struct StandardAnimation: Animation {
    public var changes: ChangeBlock?
    public var completion: CompletionBlock?
    public let duration: TimeInterval
    public let delay: TimeInterval
    public let animationOptions: UIView.AnimationOptions
    
    public init(duration: TimeInterval, delay: TimeInterval, options: UIView.AnimationOptions) {
        self.duration = duration
        self.delay = delay
        self.animationOptions = options
    }
    
    public func animate(view: UIView) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            options: animationOptions,
            animations: {
                self.changes?(view)
            },
            completion: completion
        )
    }
}

public struct SpringAnimation: Animation {
    public var changes: ChangeBlock?
    public var completion: CompletionBlock?
    public let duration: TimeInterval
    public let delay: TimeInterval
    public let animationOptions: UIView.AnimationOptions
    public let damping: CGFloat
    public let velocity: CGFloat
    
    public init(
        duration: TimeInterval,
        delay: TimeInterval,
        damping: CGFloat,
        velocity: CGFloat,
        options: UIView.AnimationOptions)
    {
        self.duration = duration
        self.delay = delay
        self.damping = damping
        self.velocity = velocity
        self.animationOptions = options
    }
    
    public func animate(view: UIView) {
        UIView.animate(
            withDuration: duration,
            delay: delay,
            usingSpringWithDamping: damping,
            initialSpringVelocity: velocity,
            options: animationOptions,
            animations: {
                self.changes?(view)
            },
            completion: completion
        )
    }
}
