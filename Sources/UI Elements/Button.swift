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
            self.dizzy.animate(self.animations, animation: self.animation, prepare: false, reversed: isHighlighted)
        }
    }
}
