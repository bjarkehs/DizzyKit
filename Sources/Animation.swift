//
//  Animation.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

protocol Animation {
    var changes: ChangeBlock? { get set}
    var completion: CompletionBlock? { get set }
    var duration: TimeInterval { get }
    var delay: TimeInterval { get }
    var animationOptions: UIViewAnimationOptions { get }
    
    func animate(view: UIView)
}

private let defaultDuration: TimeInterval = 0.3
private let defaultDelay: TimeInterval = 0
private let defaultDamping: CGFloat = 0.5
private let defaultVelocity: CGFloat = 0.7
private let defaultAnimationOptions: UIViewAnimationOptions = []

struct StandardAnimation: Animation {
    var changes: ChangeBlock?
    var completion: CompletionBlock?
    let duration: TimeInterval
    let delay: TimeInterval
    let animationOptions: UIViewAnimationOptions
    
    init(
        duration: TimeInterval = defaultDuration,
        delay: TimeInterval = defaultDelay,
        options: UIViewAnimationOptions = defaultAnimationOptions
        ) {
        self.duration = duration
        self.delay = delay
        self.animationOptions = options
    }
    
    func animate(view: UIView) {
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

struct SpringAnimation: Animation {
    var changes: ChangeBlock?
    var completion: CompletionBlock?
    let duration: TimeInterval
    let delay: TimeInterval
    let animationOptions: UIViewAnimationOptions
    let damping: CGFloat
    let velocity: CGFloat
    
    init(
        duration: TimeInterval = defaultDuration,
        delay: TimeInterval = defaultDelay,
        damping: CGFloat = defaultDamping,
        velocity: CGFloat = defaultVelocity,
        options: UIViewAnimationOptions = defaultAnimationOptions
        ) {
        self.duration = duration
        self.delay = delay
        self.damping = damping
        self.velocity = velocity
        self.animationOptions = options
    }
    
    func animate(view: UIView) {
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
