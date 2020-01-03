//
//  OverviewResponse.swift
//  NYTBookLists
//
//  Created by Elena Kulakova on 2020-01-03.
//  Copyright © 2020 Elena Kulakova. All rights reserved.
//

import Foundation

struct OverviewResponse: Codable {
    var results: Results
}

struct Results: Codable {
    var lists: [List]
}

struct List: Codable {
    var list_id: Int
    var list_name: String
    var display_name: String
    var list_image: String
    var books: [Book]
}

struct Book: Codable {
    var author: String
    var book_image: String
    var description: String
    var publisher: String
    var title: String
}
