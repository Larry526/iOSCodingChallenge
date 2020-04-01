//
//  CodingChallengeTests.swift
//  CodingChallengeTests
//
//

import XCTest
@testable import CodingChallenge

class CodingChallengeTests: XCTestCase {
    var api: StoriesApiProtocol!
    var localData: ApiModel?
    
    override func setUp() {
        api = MockApi(listener: self)
        api.fetchStories(url: "local")
    }
    
    func testModelStructure() {
        XCTAssertNotNil(localData)
    }
    
    func testStoryDataMapping() {
        if let local = localData {
            XCTAssertEqual(local.stories[0].id, "212052492")
            XCTAssertEqual(local.stories[0].title, "bill x dipper")
            XCTAssertEqual(local.stories[0].cover, "https://a.wattpad.com/cover/212052492-256-k551122.jpg")
        }
    }
    
    func testUserDataMapping() {
        if let local = localData {
            let userData = local.stories[0].user
            XCTAssertEqual(userData.name, "sinister_shipper")
            XCTAssertEqual(userData.avatar, "https://a.wattpad.com/useravatar/sinister_shipper.128.384296.jpg")
            XCTAssertEqual(userData.fullname, "sinister_shipper")
        }
    }
    
    func testNextURL() {
        if let local = localData {
            let firstNextUrl = local.nextUrl
             XCTAssertEqual(firstNextUrl, "https://www.wattpad.com/api/v3/stories?fields=stories%28id%2Ctitle%2Ccover%2Cuser%29&filter=new&limit=10&offset=10")
        }
    }
    
    func testAllStoriesMapped() {
        if let local = localData {
            XCTAssertEqual(local.stories.count, 10)
        }
    }
}

extension CodingChallengeTests: StoriesApiListener {
    func onLocalDataFetch() {}

    func onDataFetch(api: ApiModel) {
        // Passing the mock api data for testcase
        localData = api
        XCTAssert(true)
    }
}

