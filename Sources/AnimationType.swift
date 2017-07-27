//
//  AnimationType.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import UIKit

public enum AnimationType {
    case slide(SlideDirection, Distance)
    case fadeIn
    case spin(Angle)
    case expand(Scale)
    case contract(Scale)
    case custom(prepareFunction: PrepareBlock, animateFunction: ChangeBlock)
    
    public enum SlideDirection {
        case up
        case down
        case left
        case right
    }
    
    public enum Distance {
        case slightly
        case moderately
        case severely
        case byPoints(CGFloat)
    }
    
    public enum Angle {
        case slightly
        case moderately
        case severely
        case toAngle(CGFloat)
    }
    
    public enum Scale {
        case slightly
        case moderately
        case severely
        case toScale(CGFloat)
    }
    
    var prepareFunction: PrepareBlock {
        switch self {
        case .slide:
            let offset = slideOffset
            return { view in
                let currentTransform = view.transform
                let offsetTransform = CGAffineTransform(translationX: offset.x, y: offset.y)
                view.transform = currentTransform.concatenating(offsetTransform)
            }
        case .fadeIn:
            return { view in
                view.alpha = 0.0
            }
        case .spin:
            let angle = spinAngle
            return { view in
                let currentTransform = view.transform
                let spinTransform = CGAffineTransform(rotationAngle: angle)
                view.transform = currentTransform.concatenating(spinTransform)
            }
        case .expand, .contract:
            let scale = self.scale
            return { view in
                let currentTransform = view.transform
                let scaleTransform = CGAffineTransform(scaleX: scale, y: scale)
                view.transform = currentTransform.concatenating(scaleTransform)
            }
        case .custom(let prepare, _):
            return prepare
        }
    }
    
    var animationFunction: ChangeBlock {
        get {
            switch self {
            case .slide:
                return { view in
                    view.transform = CGAffineTransform(translationX: 0.0, y: 0.0)
                }
            case .fadeIn:
                return { view in
                    view.alpha = 1.0
                }
            case .spin:
                return { view in
                    view.transform = CGAffineTransform(rotationAngle: 0.0)
                }
            case .expand, .contract:
                return { view in
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }
            case .custom(_, let animation):
                return animation
            }
        }
    }
    
    var slideOffset: CGPoint {
        switch self {
        case .slide(let direction, let size):
            switch (direction, size) {
            case (.up, .slightly):
                return CGPoint(x: 0.0, y: 10.0)
            case (.up, .moderately):
                return CGPoint(x: 0.0, y: 30.0)
            case (.up, .severely):
                return CGPoint(x: 0.0, y: 50.0)
            case (.up, .byPoints(let value)):
                return CGPoint(x: 0.0, y: -value)
            case (.down, .slightly):
                return CGPoint(x: 0.0, y: -10.0)
            case (.down, .moderately):
                return CGPoint(x: 0.0, y: -30.0)
            case (.down, .severely):
                return CGPoint(x: 0.0, y: -50.0)
            case (.down, .byPoints(let value)):
                return CGPoint(x: 0.0, y: -value)
            case (.left, .slightly):
                return CGPoint(x: 10.0, y: 0.0)
            case (.left, .moderately):
                return CGPoint(x: 30.0, y: 0.0)
            case (.left, .severely):
                return CGPoint(x: 50.0, y: 0.0)
            case (.left, .byPoints(let value)):
                return CGPoint(x:  -value, y: 0.0)
            case (.right, .slightly):
                return CGPoint(x: -10.0, y: 0.0)
            case (.right, .moderately):
                return CGPoint(x: -30.0, y: 0.0)
            case (.right, .severely):
                return CGPoint(x: -50.0, y: 0.0)
            case (.right, .byPoints(let value)):
                return CGPoint(x:  -value, y: 0.0)
            }
        default:
            return CGPoint.zero
        }
    }
    
    var spinAngle: CGFloat {
        switch self {
        case .spin(let size):
            switch size {
            case .slightly:
                return .pi/4
            case .moderately:
                return .pi/2
            case .severely:
                return .pi
            case .toAngle(let value):
                return value
            }
        default:
            return 0.0
        }
    }
    
    var scale: CGFloat {
        switch self {
        case .contract(let size):
            switch size {
            case .slightly:
                return 1.1
            case .moderately:
                return 1.3
            case .severely:
                return 1.5
            case .toScale(let value):
                return value
            }
        case .expand(let size):
            switch size {
            case .slightly:
                return 0.9
            case .moderately:
                return 0.7
            case .severely:
                return 0.5
            case .toScale(let value):
                return value
            }
        default:
            return 0.0
        }
    }
}
