//
//  Deeplink+extensions.swift
//
//
//  Created by Chu Thin on 15/03/2024.
//

import Foundation
public extension URL {
    var endpointPath:String? {
        if let endpointPath = self.absoluteString.components(separatedBy: "://").last?.components(separatedBy: "?").first {
            return endpointPath
        }
        return nil
    }
}

extension Collection where Element == URLQueryItem {
    public func valueOf(_ queryParameterName: String) -> String? {
        return self.first(where: { $0.name == queryParameterName })?.value
    }
}
