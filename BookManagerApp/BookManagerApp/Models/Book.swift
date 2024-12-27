//
//  Book.swift
//  BookManagerApp
//
//  Created by Anjali on 28/12/24.
//

import Foundation

struct Book: Codable {
    let id: String
    let title: String
    let author: String
    let yearOfPublication: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case author
        case yearOfPublication = "year"
    }
}
