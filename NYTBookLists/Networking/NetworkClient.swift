//
//  NetworkClient.swift
//  NYTBookLists
//
//  Created by Elena Kulakova on 2020-01-03.
//  Copyright © 2020 Elena Kulakova. All rights reserved.
//

import Foundation

class NetworkClient {
    static let apiKey = "GeKIs4A8UtjjSLG4NZzb2uLChFNTvaoq"
    
    enum Endpoints {
        static let base = "https://api.nytimes.com/svc/books/v3"
        static let apiKeyParam = "?api-key=\(apiKey)"

        case overview
        
        var stringValue: String {
            switch self {
            case .overview: return Endpoints.base + "/lists/overview.json" + Endpoints.apiKeyParam
            }
        }
        
        var url: URL {
            return URL(string: stringValue)!
        }
    }
    
    class func getListOverview(completion: @escaping (OverviewResponse?, Error?) -> Void) {
        let url = Endpoints.overview.url
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            if let overviewResponse = try? JSONDecoder().decode(OverviewResponse.self, from: data) {
                completion(overviewResponse, nil)
            } else {
                completion(nil, error)
            }
        }
        task.resume()
    }
}
