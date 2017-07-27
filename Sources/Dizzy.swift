//
//  DizzyKit.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

typealias PrepareBlock = (_ view: UIView) -> Void
typealias ChangeBlock = (_ view: UIView) -> Void
typealias CompletionBlock = (_ finished: Bool) -> Void

struct Dizzy {
    let view: UIView
}

private let defaultDuration: TimeInterval = 0.3
private let defaultDelay: TimeInterval = 0
private let defaultAnimationOptions: UIViewAnimationOptions = []
private let defaultPrepare: Bool = true

extension Dizzy {
    func animate(
        _ animations: [AnimationType],
        duration: TimeInterval = defaultDuration,
        delay: TimeInterval = defaultDelay,
        options: UIViewAnimationOptions = defaultAnimationOptions,
        prepare: Bool = defaultPrepare,
        completion: CompletionBlock? = nil
        ) {
        let animation = StandardAnimation(duration: duration, delay: delay, options: options)
        self.animate(animations, animation: animation, completion: completion)
    }
    
    func animate(
        _ animations: [AnimationType],
        animation: Animation,
        prepare: Bool = defaultPrepare,
        completion: CompletionBlock? = nil
        ) {
        if prepare {
            self.prepare(with: animations)
        }
        
        var animation = animation
        animation.changes = { view in
            for animation in animations {
                let animationFunc = animation.animationFunction
                animationFunc(view)
            }
        }
        animation.completion = completion
        animation.animate(view: view)
    }
    
    func prepare(with animations: [AnimationType]) {
        UIView.performWithoutAnimation {
            for animation in animations {
                animation.prepareFunction(self.view)
            }
        }
    }
}

extension UIView {
    var dizzy: Dizzy {
        return Dizzy(view: self)
    }
}
