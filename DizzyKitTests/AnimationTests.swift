//
//  AnimationTests.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import XCTest
@testable import DizzyKit

class AnimationTests: XCTestCase {
    func testStandardAnimation() {
        let duration = 0.2
        let delay = 0.1
        let options: UIView.AnimationOptions = [.curveEaseInOut]
        var animation = StandardAnimation(duration: duration, delay: delay, options: options)
        XCTAssertEqual(animation.duration, duration)
        XCTAssertEqual(animation.delay, delay)
        XCTAssertEqual(animation.animationOptions, options)
        
        
        let changesExpectation = expectation(description: "changes block has run")
        animation.changes = { view in
            changesExpectation.fulfill()
        }
        
        let completionExpectation = expectation(description: "completion block has run")
        animation.completion = { finished in
            completionExpectation.fulfill()
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

        animation.animate(view: view)
        
        waitForExpectations(timeout: duration + delay + 0.1, handler: nil)
    }
    
    func testSprintAnimation() {
        let duration = 0.2
        let delay = 0.1
        let damping: CGFloat = 0.2
        let velocity: CGFloat = 0.3
        let options: UIView.AnimationOptions = [.curveEaseInOut]
        var animation = SpringAnimation(duration: duration, delay: delay, damping: damping, velocity: velocity, options: options)
        XCTAssertEqual(animation.duration, duration)
        XCTAssertEqual(animation.delay, delay)
        XCTAssertEqual(animation.damping, damping)
        XCTAssertEqual(animation.velocity, velocity)
        XCTAssertEqual(animation.animationOptions, options)
        
        let changesExpectation = expectation(description: "changes block has run")
        animation.changes = { view in
            changesExpectation.fulfill()
        }
        
        let completionExpectation = expectation(description: "completion block has run")
        animation.completion = { finished in
            completionExpectation.fulfill()
        }
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        animation.animate(view: view)
        
        waitForExpectations(timeout: duration + delay + 0.1, handler: nil)
    }
}
