//
//  DizzyKit.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

public typealias PrepareBlock = (_ view: UIView) -> Void
public typealias ChangeBlock = (_ view: UIView) -> Void
public typealias CompletionBlock = (_ finished: Bool) -> Void

public struct Dizzy {
    let view: UIView
}

public extension Dizzy {
    public func animate(
        _ animations: [AnimationType],
        duration: TimeInterval = Settings.Animation.duration,
        delay: TimeInterval = Settings.Animation.delay,
        options: UIViewAnimationOptions = Settings.Animation.options,
        prepare: Bool = Settings.prepare,
        completion: CompletionBlock? = nil)
    {
        let animation = StandardAnimation(duration: duration, delay: delay, options: options)
        self.animate(animations, animation: animation, completion: completion)
    }

    public func animate(
        _ animations: [AnimationType],
        animation: Animation,
        prepare: Bool = Settings.prepare,
        completion: CompletionBlock? = nil)
    {
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

    public func prepare(with animations: [AnimationType]) {
        UIView.performWithoutAnimation {
            for animation in animations {
                animation.prepareFunction(self.view)
            }
        }
    }
}

public extension UIView {
    public var dizzy: Dizzy {
        return Dizzy(view: self)
    }
}
