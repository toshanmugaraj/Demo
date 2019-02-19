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
import Mockingjay
@testable import demo

class demoTests: QuickSpec {
    
    override func spec() {
        beforeEach {
//            let body = self.loadJSONStub(fileName: "mock.json", bundle: bundle)
//            let data = jsonData(body.data(using: .utf8)!)
            
            
        }
        describe("When data request is sent") {
            it("can test the response") {
                var country: Country?
                waitUntil { done in
                ContentProvider().getContent(urlString: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json", callback: { (result) in
                     expect(result).notTo(beNil())
                     done()
                })
                }
            }
        }
    }
}
