//
//  demoTests.swift
//  demoTests
//
//  Created by RNTBCI45 on 12/02/19.
//  Copyright © 2019 demo. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import demo

class demoTests: QuickSpec {
    
    override func spec() {
        
        describe("When data request is sent") {
            var testFile: String?
            
            beforeEach {
                testFile = nil
                if let filePath = self.mockURLPath(fileName: "mock", bundle: Bundle(for: demoTests.self)) {
                    testFile = "file://\(filePath)"
                }
            }
            it("can test the response") {
                var country: Country?
                ContentProvider().getContent(urlString: testFile!, callback: { (result) in
                    country = result
                })
                expect(country?.rows?.count).toEventually(equal(1))
            }
        }
    }
    
     func mockURLPath(fileName: String, bundle: Bundle) -> String? {
        guard let filePath = bundle.path(forResource: fileName, ofType: "json")  else {
           return nil
        }
        return filePath
    }
}
