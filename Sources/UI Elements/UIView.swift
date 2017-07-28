//
//  UIView.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 28/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

public extension UIView {
    public var dizzy: Dizzy {
        return Dizzy(view: self)
    }
}
