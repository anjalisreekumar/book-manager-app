//
//  NetworkManager.swift
//  BookManagerApp
//
//  Created by Anjali on 28/12/24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    private let baseURL = "http://localhost:8080"
    
    func fetchBooks(completion: @escaping (Result<[Book], Error>)->Void) {
        guard let url = URL(string: "\(baseURL)/books") else {
            print("Could not convert URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Something went wrong")
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500)))
                return
            }
            
            do {
                let bookData = try JSONDecoder().decode([Book].self, from: data)
                completion(.success(bookData))
            }
            catch {
                print("Could not decode")
                completion(.failure(error))
            }
        }.resume()
        
    }
    
    
    
    
    
    
}
