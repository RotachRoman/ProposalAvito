//
//  IconProposal.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 14.01.2021.
//

import Foundation

struct IconProposal: Codable {
    let the52X52: String
    
    init(the52X52: String) {
        self.the52X52 = the52X52
    }

    private enum CodingKeys: String, CodingKey {
        case the52X52 = "52x52"
    }
}
