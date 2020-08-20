//
//  Paparazzi_Pros_SwiftUITests.swift
//  Paparazzi Pros SwiftUITests
//
//  Created by Asad Khan on 05/08/2020.
//  Copyright © 2020 Paparazzi Pros. All rights reserved.
//

import XCTest
import Combine
import Foundation
@testable import FirebaseAuth

@testable import Pods_Paparazzi_Pros_SwiftUI

class Paparazzi_Pros_SwiftUITests: XCTestCase {
    var cancelAble: AnyCancellable?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLogin() throws {
        let user = User.init()
        let authPublisher = user.authenticateUser(withEmail: "asad@one.com", andPassword: "111111")
        cancelAble = authPublisher.sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Auth FAILED! \(error.localizedDescription)")
                }
            }) {(value) in
                print("Auth SUCCESS!@ \(value)")
                
                XCTAssert(value == true)
        }
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    deinit {
        print("Deinit XCTest")
        cancelAble?.cancel()
    }
}
