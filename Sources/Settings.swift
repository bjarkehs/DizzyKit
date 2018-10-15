//
//  Settings.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

public struct Settings {
    public static var prepare: Bool = false
    public static var reversed: Bool = false
    public struct Animation {
        public static var duration: TimeInterval = 0.3
        public static var delay: TimeInterval = 0
        public static var damping: CGFloat = 0.5
        public static var velocity: CGFloat = 0.7
        public static var options: UIView.AnimationOptions = []
    }
}
