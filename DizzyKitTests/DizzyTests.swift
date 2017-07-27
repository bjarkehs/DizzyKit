//
//  DizzyTests.swift
//  DizzyKit
//
//  Created by Bjarke Hesthaven Søndergaard on 27/07/2017.
//  Copyright © 2017 BjarkeHS. All rights reserved.
//

import XCTest
@testable import DizzyKit

class DizzyTests: XCTestCase {
    func testPrepare() {
        let prepareExpectation = expectation(description: "prepare has run")
        let animationType: AnimationType = .custom(
            prepareFunction: { view in
                prepareExpectation.fulfill()
            },
            animateFunction: { view in }
        )
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        view.dizzy.prepare(with: [animationType])
        
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testAnimate() {
        let animateExpectation = expectation(description: "animate has run")
        let animationType: AnimationType = .custom(
            prepareFunction: { view in },
            animateFunction: { view in
                animateExpectation.fulfill()
            }
        )
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let duration = 0.1
        
        view.dizzy.animate([animationType], duration: duration)
        waitForExpectations(timeout: duration + 0.01, handler: nil)
    }
    
    func testPrepareInAnimate() {
        let prepareExpectation = expectation(description: "prepare has run")
        let animateExpectation = expectation(description: "animate has run")
        let animationType: AnimationType = .custom(
            prepareFunction: { view in
                prepareExpectation.fulfill()
            },
            animateFunction: { view in
                animateExpectation.fulfill()
            }
        )
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let duration = 0.1
        
        view.dizzy.animate([animationType], duration: duration, prepare: true)
        waitForExpectations(timeout: duration + 0.01, handler: nil)
    }
    
    func testUIViewDizzy() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        XCTAssertEqual(view.dizzy.view, view)
    }
}
