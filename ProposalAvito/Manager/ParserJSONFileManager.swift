//
//  ParserJSONFileManager.swift
//  ProposalAvito
//
//  Created by Rotach Roman on 14.01.2021.
//

import Foundation

class ParserJSONFileManager {
    
    func getData(forResource resource: String) -> HeadProposal? {
        guard let jsonURL = Bundle(for: type(of: self)).path(forResource: resource, ofType: "json") else {
            print(("Missing file: result.json"))
            fatalError()
        }
        guard let jsonString = try? String(contentsOf: URL(fileURLWithPath: jsonURL), encoding: String.Encoding.utf8) else {
            print("Missing: json to string")
            fatalError()
        }
        var welcome: Welcome?
        do {
            welcome = try JSONDecoder().decode(Welcome.self, from: Data(jsonString.utf8))
        } catch let error as NSError {
            print(error)
        }
        guard let result = welcome else {
            return nil
        }
        return result.headProposal
    }
}
