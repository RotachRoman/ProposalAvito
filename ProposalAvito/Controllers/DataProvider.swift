//
//  DataProvider.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 07.01.2021.
//

import UIKit

class DataProvider: NSObject {
    var proposalManager: ProposalManager?
}

extension DataProvider: UICollectionViewDelegate {
    
}

extension DataProvider: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let proposalManager = proposalManager else { return 0 }
        return proposalManager.proposalCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ProposalCell.self), for: indexPath) as! ProposalCell
        
        var proposal: Proposal
        guard let proposalManager = proposalManager else {
            fatalError()
        }
        proposal = proposalManager.proposal(at: indexPath.row)
        cell.configure(withProposal: proposal)
        
        //MARK: - Not Unit Testing
        cell.contentView.backgroundColor = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        cell.contentView.layer.cornerRadius = 4
        return cell
    }
    
    // MARK: - Not Unit tests
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        proposalManager?.choose(at: indexPath.row)
        collectionView.reloadData()
    }
    
}

extension DataProvider: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
