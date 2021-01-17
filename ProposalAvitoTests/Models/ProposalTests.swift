//
//  ProposalsTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class ProposalTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreateProposal() {
        let proposal = Proposal(title: "Foo", price: "100")
        XCTAssertNotNil(proposal)
    }
    
    func testInitProposalWithTitle(){
        let proposal = Proposal(title: "Foo", price: "100")
        XCTAssertEqual(proposal.title, "Foo")
    }
    
    func testInitProposalWithDescription(){
        let proposal = Proposal(title: "Foo", description: "Bar", price: "100")
        XCTAssertEqual(proposal.description, "Bar")
    }
    
    func testInitProposalWithPrice(){
        let proposal = Proposal(title: "Foo", price: "100 ₽")
        XCTAssertEqual(proposal.price, "100 ₽")
    }
    
//    func testInitProposalWithIsSelected(){
//        let proposal = Proposal(title: "Foo", price: "100", isSelect: true)
//        XCTAssertEqual(proposal.isSelect, true)
//    }
    
    func testOnlyOneSelectedProposal(){
        _ = Proposal(title: "Foo", price: "100 ₽", isSelect: true)
        let proposal2 = Proposal(title: "Foo", price: "100 ₽", isSelect: true)
        
        XCTAssertEqual(proposal2.isSelect, false)
    }
    
    func testImageStringURlProposal(){
        let icon = IconProposal(the52X52: "https://www.avito.ru/s/common/components/monetization/icons/apps/vas-x5_1-52.png")
        _ = Proposal(title: "Foo", price: "100 ₽", icon: icon)
        let proposal2 = Proposal(title: "Foo", price: "100 ₽", isSelect: true)
        
        XCTAssertEqual(proposal2.isSelect, false)
    }
    
}
