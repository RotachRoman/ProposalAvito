//
//  DataFetcherService.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 05.02.2021.
//

import Foundation

protocol InitDataFetcherServiceProtocol {
    init(localDataFetcher: LocalDataFetcherProtocol)
}

protocol DataFetcherServiceProtocol: InitDataFetcherServiceProtocol {
    func fetchProposals(completion: @escaping (Welcome?) -> ())
}


class DataFetcherService: DataFetcherServiceProtocol {
    var localDataFetcher: LocalDataFetcherProtocol!
    
    required init(localDataFetcher: LocalDataFetcherProtocol = LocalDataFetcher()) {
        self.localDataFetcher = localDataFetcher
    }
 
    func fetchProposals(completion: @escaping (Welcome?) -> ()){
        let urlString = "result.json"
        localDataFetcher.fetchLocalFile(urlString: urlString, response: completion)
    }
}
