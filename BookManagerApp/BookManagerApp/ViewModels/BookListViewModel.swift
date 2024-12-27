//
//  BookListViewModel.swift
//  BookManagerApp
//
//  Created by Anjali on 28/12/24.
//

import Foundation

class BookListViewModel {
    var bookList: [Book] = []
    var onBooksLoaded: (() -> Void)?
    var onError: ((Error) -> Void)?
    
    func fetchBooks(){
        NetworkManager.shared.fetchBooks { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let books):
                    self?.bookList = books
                    self?.onBooksLoaded?()
                    
                case .failure(let error):
                    self?.onError?(error)
                    
                }
            }
        }
    }
    
}
