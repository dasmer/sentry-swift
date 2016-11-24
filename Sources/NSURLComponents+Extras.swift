//
//  NSURLComponents+Extras.swift
//  SentrySwift
//
//  Created by Daniel Griesser on 24/11/2016.
//
//

import Foundation

internal typealias QueryItem = (name: String, value: String?)

extension NSURLComponents {
    
    func setQueryComponents(queryItems queryItems: [QueryItem]) {
        if #available(iOS 8.0, *) {
            self.queryItems = queryItems.map { name, value in
                return URLQueryItem(name: name, value: value)
            }
        } else {
            let query = queryItems.flatMap { queryItem -> String in
                if let value = queryItem.value {
                    return "\(queryItem.name)=\(value)"
                }
                return ""
            }.joined(separator: "&")
            self.query = query
        }
    }
    
}
