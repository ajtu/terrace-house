//
//  TerraceHouseTests.swift
//  TerraceHouseTests
//
//  Created by Alvin Tu on 6/2/20.
//  Copyright © 2020 Alvin Tu. All rights reserved.
//

import XCTest
@testable import TerraceHouse

class TerraceHouseTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testMemberViewModel(){

        let member = HouseMember(englishName: "bob", japaneseName: "", profession: "plumber", age: "25", episodes: "01-20", numberOfEpisodes: "20", instagramLink: "")
        let memberViewModel = HouseMemberViewModel(member: member)
        
        XCTAssertEqual(member.age, memberViewModel.ageLabelString)
    }

}
