//
//  Porposal.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import Foundation

struct Proposal: Codable {
    
    static private var isOneSelected: Bool = false
    
    let title: String
    let description: String?
    let price: String
    let icon: IconProposal?
    var isSelect: Bool
    
    private enum CodingKeys: String, CodingKey {
        case title, description, price, icon
        case isSelect = "isSelected"
    }
    
    init(title: String, description: String? = nil, price: String, icon: IconProposal? = nil, isSelect: Bool? = false) {
        self.title = title
        self.description = description
        self.price = price
        self.icon = icon
        
        if !Proposal.isOneSelected {
            self.isSelect = isSelect!
            Proposal.isOneSelected = true
        } else {
            self.isSelect = false
        }
    }
}
