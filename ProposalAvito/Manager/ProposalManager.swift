//
//  ProposalManager.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import Foundation

class ProposalManager {
    
    var proposalCount: Int {
        return proposals.count
    }
    
    private var numberChooseItem: Int?
    private var isOneSelected: Bool = false
    private var hProposal: HeadProposal? = nil
    private var proposals: [Proposal] = []
    
    private func add(proposal: Proposal, number: Int){
        var newProposal = proposal
        
        if proposal.isSelect {
            if !isOneSelected {
                numberChooseItem = number
                isOneSelected = true
            } else {
                newProposal.isSelect = false
            }
        }
        proposals.append(newProposal)
    }
    
    func proposalsArr() -> [Proposal] {
        return proposals
    }
    
    func headProposal() -> HeadProposal? {
        return hProposal ?? nil
    }
    
    func proposal(at index: Int) -> Proposal {
        return proposals[index]
    }
    
    func chooseItem() -> Proposal? {
        guard let numberChooseItem = numberChooseItem else { return nil }
        return proposals[numberChooseItem]
    }
    
    func choose(at index: Int){
        if let numberChooseItem = numberChooseItem {
            if proposals[index].isSelect {
                proposals[index].isSelect = false
                self.numberChooseItem = nil
            } else {
                proposals[index].isSelect = true
                proposals[numberChooseItem].isSelect = false
                self.numberChooseItem = index
            }
        } else {
            proposals[index].isSelect = true
            self.numberChooseItem = index
        }
    }
    
    func parserDataWithFile(fileName: String){
        let network = DataFetcherService()
        
        network.fetchProposals {[weak self] welcome in
            guard let self = self else { return }
            
            guard let welcome = welcome,
            let headProposal = welcome.headProposal
                  else {
                print("Head Proposal equeal nil")
                return
            }
                    
            self.hProposal = headProposal
            var i = 0
            while (i < (headProposal.proposals!.count)){
                self.add(proposal: headProposal.proposals![i], number: i)
                i += 1
            }
        }
    }
}
