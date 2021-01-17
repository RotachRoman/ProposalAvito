//
//  WelcomTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 17.01.2021.
//

import XCTest
@testable import ProposalAvito

class WelcomTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testCreateWelcomeProposal() {
        let welcomeProposal = Welcome(status: "Ok")
        XCTAssertNotNil(welcomeProposal)
    }
    
    func testInitWelcomeWithStatus() {
        let welcomeProposal = Welcome(status: "Ok", headProposal: nil)
        XCTAssertEqual(welcomeProposal.status, "Ok")
    }
    
    func testInitWelcomeWithNilHeadProposal() {
        let welcomeProposal = Welcome(status: "Ok", headProposal: nil)
        XCTAssertNil(welcomeProposal.headProposal)
    }
    
    func testInitWelcomeWithHeadProposal() {
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "")
        let welcomeProposal = Welcome(status: "Ok", headProposal: headProposal)
        XCTAssertEqual(welcomeProposal.headProposal?.mainTitle, "Foo")
    }

}
