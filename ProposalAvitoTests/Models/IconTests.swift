//
//  IconTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 15.01.2021.
//

import XCTest
@testable import ProposalAvito

class IconTests: XCTestCase {

    func testCreateHeadProposal() {
        let iconProposal = IconProposal(the52X52: "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x5_1-52.png")
        XCTAssertNotNil(iconProposal)
    }
}
