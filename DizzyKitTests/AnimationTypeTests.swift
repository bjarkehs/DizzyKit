//
//  AnimationTypeTests.swift
//  DizzyKitTests
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import XCTest
@testable import DizzyKit

class AnimationTypeTests: XCTestCase {
    func testSlideUp() {
        let animation: AnimationType = .slide(.up, .slightly)
        let offset = animation.slideOffset
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let originBefore = view.frame.origin
        animation.prepareFunction(view)
        
        XCTAssertNotEqual(view.frame.origin.y, originBefore.y)
        XCTAssertEqual(view.frame.origin.x, originBefore.x)
        XCTAssertEqual(view.frame.origin, offset)
        
        animation.animationFunction(view)
        XCTAssertEqual(view.frame.origin, originBefore)
    }
    
    func testFadeIn() {
        let animation: AnimationType = .fadeIn
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        animation.prepareFunction(view)
        XCTAssertEqual(view.alpha, 0)
        
        animation.animationFunction(view)
        XCTAssertEqual(view.alpha, 1)
    }
    
    func testSpin() {
        let animation: AnimationType = .spin(.slightly)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let originBefore = view.frame.origin
        animation.prepareFunction(view)
        
        XCTAssertNotEqual(view.frame.origin.y, originBefore.y)
        XCTAssertNotEqual(view.frame.origin.x, originBefore.x)
        
        animation.animationFunction(view)
        XCTAssertEqual(view.frame.origin, originBefore)
    }
    
    func testExpand() {
        let animation: AnimationType = .expand(.slightly)
        let scale = animation.scale
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let frameBefore = view.frame
        animation.prepareFunction(view)
        
        XCTAssertNotEqual(view.frame.origin.y, frameBefore.origin.y)
        XCTAssertNotEqual(view.frame.origin.x, frameBefore.origin.x)
        XCTAssertNotEqual(view.frame.size.width, frameBefore.size.width)
        XCTAssertNotEqual(view.frame.size.height, frameBefore.size.height)
        XCTAssertEqual(view.frame.size.width, frameBefore.size.width * scale, accuracy: 0.00001)
        XCTAssertEqual(view.frame.size.height, frameBefore.size.height * scale, accuracy: 0.00001)
        
        animation.animationFunction(view)
        XCTAssertEqual(view.frame, frameBefore)
    }
    
    func testContract() {
        let animation: AnimationType = .contract(.slightly)
        let scale = animation.scale
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let frameBefore = view.frame
        animation.prepareFunction(view)
        
        XCTAssertNotEqual(view.frame.origin.y, frameBefore.origin.y)
        XCTAssertNotEqual(view.frame.origin.x, frameBefore.origin.x)
        XCTAssertNotEqual(view.frame.size.width, frameBefore.size.width)
        XCTAssertNotEqual(view.frame.size.height, frameBefore.size.height)
        XCTAssertEqual(view.frame.size.width, frameBefore.size.width * scale, accuracy: 0.00001)
        XCTAssertEqual(view.frame.size.height, frameBefore.size.height * scale, accuracy: 0.00001)
        
        animation.animationFunction(view)
        XCTAssertEqual(view.frame, frameBefore)
    }
}
