//
//  IconTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 15.01.2021.
//

import XCTest
@testable import ProposalAvito

class IconTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateHeadProposal() {
        let iconProposal = IconProposal(the52X52: "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x5_1-52.png")
        XCTAssertNotNil(iconProposal)
    }
}
