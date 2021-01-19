//
//  WelcomTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 17.01.2021.
//

import XCTest
@testable import ProposalAvito

class WelcomTests: XCTestCase {

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
