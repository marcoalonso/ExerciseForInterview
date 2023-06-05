//
//  Manager.swift
//  Exercise
//
//  Created by Marco Alonso Rodriguez on 05/06/23.
//

import Foundation

enum ItemError: Error {
    case badURL
    case badRequest
    case decodingError
}

protocol ManagerItemProtocol {
    func getItems(items: [TaskItem])
    func showError(with: Error)
}

struct Manager {
    
    static let urlString = "https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json"
    
    static let urlStringMock = "https://gist.githubusercontent.com/rigovides/12708f4aed26f847a0fe34f0fef1dbd7/raw/bb5a9a21f599acb2a46d01f45709d0aeb669f965/items.json2"
    
    var delegate: ManagerItemProtocol?
    
    func getItems(urlString: String){
       
        guard let url = URL(string: urlString) else {
            delegate?.showError(with: ItemError.badURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            if error != nil {
                delegate?.showError(with: ItemError.badRequest)
            }
            
            guard let data = data else { return }
            
            do {
             
                let decodedData = try JSONDecoder().decode([TaskItem].self, from: data)
                print(decodedData)
                
                delegate?.getItems(items: decodedData)
                
            } catch {
                delegate?.showError(with: ItemError.decodingError)
                print("Debug: error \(error.localizedDescription)")
            }
            
        }.resume()
    }
}
