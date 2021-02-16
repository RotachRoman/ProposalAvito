//
//  LocalDataFetcher.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 05.02.2021.
//

import Foundation

protocol LocalDataFetcherProtocol {
    func fetchLocalFile<T: Decodable>(urlString: String, response: @escaping (T?)-> ())
}

class LocalDataFetcher: LocalDataFetcherProtocol{
    func fetchLocalFile<T: Decodable>(urlString: String, response: @escaping (T?)-> ()){
        guard let file = Bundle.main.url(forResource: urlString, withExtension: nil) else {
            response(nil)
            return
        }
        do {
            let data = try Data(contentsOf: file)
            let decoded = decodeJSON(type: T.self, from: data)
            response(decoded)
        } catch let error as NSError {
            print(error)
            print(error.localizedDescription)
            response(nil)
            return
        }
    }
    
    private func decodeJSON<T: Decodable>(type: T.Type, from data: Data?) -> T?{
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let object = try decoder.decode(T.self, from: data)
            return object
        } catch let error as NSError {
            print(error)
            print(error.localizedDescription)
            return nil
        }
    }
}
