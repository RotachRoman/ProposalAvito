//
//  Welcome.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 14.01.2021.
//

import Foundation

struct Welcome: Codable {
    let status: String
    let headProposal: HeadProposal?
    
    init(status: String, headProposal: HeadProposal? = nil)  {
        self.status = status
        self.headProposal = headProposal
    }
    
    private enum CodingKeys: String, CodingKey {
        case status
        case headProposal = "result"
    }
}
