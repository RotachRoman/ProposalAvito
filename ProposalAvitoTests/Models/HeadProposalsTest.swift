//
//  ProposalsTest.swift
//  ProposelAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class HeadProposalsTest: XCTestCase {

    func testCreateHeadProposal() {
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "")
        XCTAssertNotNil(headProposal)
    }
    
    func testInitProposalWithTitle(){
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "")
        XCTAssertEqual(headProposal.mainTitle, "Foo")
    }
    
    func testInitProposalWithActionTitle(){
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "Roo")
        XCTAssertEqual(headProposal.actionTitle, "Roo")
    }
    
    func testInitHeadProposalWithProposals() {
        let proposal = Proposal(title: "", price: "100")
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar",  proposals: [proposal], actionTitle: "")
        XCTAssertNotNil(headProposal.proposals)
    }
    
    func testInitHeadProposalWithTitleActionButton(){
        let headProposal = HeadProposal(mainTitle: "Foo", titleActionButton: "Bar", actionTitle: "")
        
        XCTAssertEqual(headProposal.titleActionButton, "Bar")
    }
}
