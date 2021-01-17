//
//  Proposal.swift
//  ProposelAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import Foundation

struct HeadProposal: Codable {
    let mainTitle: String
    let titleActionButton: String
    let actionTitle: String
    let proposals: [Proposal]?
    
    private enum CodingKeys: String, CodingKey {
        case actionTitle
        case proposals = "list"
        case mainTitle = "title"
        case titleActionButton = "selectedActionTitle"
    }
    
    init(mainTitle: String, titleActionButton: String, proposals: [Proposal]? = nil, actionTitle: String) {
        self.mainTitle = mainTitle
        self.titleActionButton = titleActionButton
        self.proposals = proposals
        self.actionTitle = actionTitle
    }
}

