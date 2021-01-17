//
//  DataProviderTests.swift
//  ProposalAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class DataProviderTests: XCTestCase {
    
    var sut: DataProvider!
    var collectionView: UICollectionView!

    override func setUpWithError() throws {
        sut = DataProvider()
        sut.proposalManager = ProposalManager()
        
        let proposalViewController = ProposalViewController()
        proposalViewController.loadViewIfNeeded()
        
        collectionView = proposalViewController.collectionView
        collectionView.delegate = sut
        collectionView.dataSource = sut
    }

    override func tearDownWithError() throws {
        sut = nil
        collectionView = nil
    }
    
    func testInitDataProvider(){
        XCTAssertNotNil(sut)
    }
    
    func testNumberOfSectionsIsOne() {
        let numberOfSections = collectionView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 1)
    }
    
    func testNumberOfItemsInSection(){
        sut.proposalManager?.add(proposal: Proposal(title: "Foo", price: "100"), number: 0)
        sut.proposalManager?.add(proposal: Proposal(title: "Bar", price: "200"), number: 1)
        
        XCTAssertEqual(collectionView?.numberOfItems(inSection: 0), 2)
    }

}
