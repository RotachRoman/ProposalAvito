//
//  ProposalManagerTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class ProposalManagerTests: XCTestCase {
    
    var sut: ProposalManager!

    override func setUpWithError() throws {
        sut = ProposalManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func testInitProposalManager(){
         XCTAssertNotNil(sut)
    }
    
    func testInitProposalWithZeroProposal() {
        XCTAssertEqual(sut.proposalCount, 0)
    }
    
    func testAtIndexIsAddedProposalTitle() {
        let proposal = Proposal(title: "Foo", price: "100")
        sut.add(proposal: proposal, number: 0)
        
        let returnedProposal = sut.proposal(at: 0)
        
        XCTAssertEqual(proposal.title, returnedProposal.title)
    }
    
    func testAtIndexIsAddedProposalPrice() {
        let proposal = Proposal(title: "Foo", price: "100")
        sut.add(proposal: proposal, number: 0)
        
        let returnedProposal = sut.proposal(at: 0)
        
        XCTAssertEqual(proposal.price, returnedProposal.price)
    }
    
    func testAtIndexIsAddedProposalDdescription() {
        let proposal = Proposal(title: "Foo", description: "Bar", price: "100")
        sut.add(proposal: proposal, number: 0)
        
        let returnedProposal = sut.proposal(at: 0)
        
        XCTAssertEqual(proposal.description, returnedProposal.description)
    }
    
    func testReturnNumberSelectedProposal(){
        let proposal = Proposal(title: "Foo", price: "100")
        let proposal2 = Proposal(title: "Bar", price: "200")
        sut.add(proposal: proposal, number: 0)
        sut.add(proposal: proposal2, number: 1)
        
        sut.choose(at: 1)
        
        XCTAssertEqual(sut.chooseItem()!.title, "Bar")
    }
    
    func testReturnChangedNumberSelectedProposal(){
        let proposal = Proposal(title: "Foo", price: "100")
        let proposal2 = Proposal(title: "Bar", price: "200")
        sut.add(proposal: proposal, number: 0)
        sut.add(proposal: proposal2, number: 1)
        
        sut.choose(at: 1)
        sut.choose(at: 0)
        
        XCTAssertEqual(sut.chooseItem()!.title, "Foo")
    }
    
    func testClickOnTheSelectItemYetNotSelected(){
        let proposal = Proposal(title: "Foo", price: "100")
        sut.add(proposal: proposal, number: 0)
       
        sut.choose(at: 0)
        sut.choose(at: 0)

        XCTAssertNil(sut.chooseItem())
    }
    
    // XL обьявление changed when changed data file
    func testGettingFromParserJSON(){ sut.parserDataWithFile(fileName: "result")
        XCTAssertEqual(sut.proposal(at: 0).title, "XL объявление")
    }
    
//    func testAddWithTwoTrueNumber(){
//        let proposal = Proposal(title: "Foo", price: "100", isSelect: true)
//        let proposal2 = Proposal(title: "Bar", price: "200", isSelect: true)
//        sut.add(proposal: proposal, number: 0)
//        sut.add(proposal: proposal2, number: 1)
//
//        XCTAssertEqual(sut.chooseItem()!.title, "Foo")
//    }

}
