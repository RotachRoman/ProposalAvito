//
//  ProposelAvitoTests.swift
//  ProposelAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class ProposalAvitoTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testInitialViewControllerIsProposalViewController(){
        let window = UIWindow()
        window.rootViewController = ProposalViewController()
        
        XCTAssertTrue(window.rootViewController is ProposalViewController)
    }
    
}
