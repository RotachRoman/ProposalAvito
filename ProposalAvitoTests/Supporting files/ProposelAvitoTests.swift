//
//  ProposelAvitoTests.swift
//  ProposelAvitoTests
//
//  Created by Rotach Roman on 07.01.2021.
//

import XCTest
@testable import ProposalAvito

class ProposalAvitoTests: XCTestCase {
    
    func testInitialViewControllerIsProposalViewController(){
        let window = UIWindow()
        window.rootViewController = ProposalViewController()
        
        XCTAssertTrue(window.rootViewController is ProposalViewController)
    }
    
}
