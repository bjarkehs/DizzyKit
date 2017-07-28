//
//  Button.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 28/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

open class Button: UIButton {
    open var animations: [AnimationType] = [.expand(.slightly)]
    
    open var animation: Animation = StandardAnimation(duration: 0.2, delay: 0, options: [])
    
    override open var isHighlighted: Bool {
        didSet {
            let highlighted = isHighlighted
            guard highlighted != oldValue else {
                return
            }
            let changes: ChangeBlock = { [weak self] view in
                guard let strongSelf = self else { return }
                
                for animation in strongSelf.animations {
                    let animationFunc: ChangeBlock
                    if highlighted {
                        animationFunc = animation.prepareFunction
                    } else {
                        animationFunc = animation.animationFunction
                    }
                    
                    animationFunc(view)
                }
                
            }
            animation.changes = changes
            animation.animate(view: self)
        }
    }
}
