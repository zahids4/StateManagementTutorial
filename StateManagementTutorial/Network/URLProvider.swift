//
//  URLProvider.swift
//  StateManagementTutorial
//
//  Created by Saim Zahid on 2022-01-11.
//

import Foundation

fileprivate struct Constants {
    static let version3 = "v3"
    static let https = "https"
    static let wattpadBaseURL = "wattpad.com"
}

struct Endpoint {
    let path: String
    let queryItems: [URLQueryItem]
}

extension Endpoint {
    static func storiesEndpoint(offset: String = "0",
                                limit: String = "50",
                                fields: String = "stories(id,title,cover,user)",
                                filter: String = "new") -> Endpoint {
        return Endpoint(
            path: "/api/\(Constants.version3)/stories",
            queryItems: [
                URLQueryItem(name: "offset", value: offset),
                URLQueryItem(name: "limit", value: limit),
                URLQueryItem(name: "fields", value: fields),
                URLQueryItem(name: "filter", value: filter),
            ]
        )
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = Constants.https
        components.host = Constants.wattpadBaseURL
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}


/**
 VIG'S CODING CHALLENGE URL CLASS
 
 
 import Foundation

 // MARK: - Stories URL Builder
 internal enum StoriesURLBuilder {
     
     private enum Constants {
         static let offset = "0"
         static let limit = "10"
     }
     
     enum Field: String {
         case id, title, cover, user
         
         static let queryName = "fields"
         
         static func queryValue(for options: [Field]) -> String {
             let options = options.map {$0.rawValue}.joined(separator: ",")
             return "stories(\(options))"
         }
     }
     
     enum Filters: String {
         case new
         
         static let queryName = "filter"
     }
     
     enum Bounds: String {
         case offset, limit
     }
     
     static let host = "www.wattpad.com"
     static let storiesPath = "/api/v3/stories"
     
     static let newFilteredStoriesUrl: URL = {
         var components = URLComponents()
         components.scheme = "https"
         components.host = host
         components.path = storiesPath
         components.queryItems = [
             URLQueryItem(name: Bounds.offset.rawValue, value: Constants.offset),
             URLQueryItem(name: Bounds.limit.rawValue, value: Constants.limit),
             URLQueryItem(name: Field.queryName, value: Field.queryValue(for: [Field.id, Field.title, Field.cover, Field.user])),
             URLQueryItem(name: Filters.queryName, value: Filters.new.rawValue),
         ]
         
         if let url = components.url {
             return url
         } else {
             fatalError("Cannot initalize service URL")
         }
     }()
 }
 */
