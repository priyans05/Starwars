//
//  APIError.swift
//  Starwars
//
//  Created by PRIYANS on 21/2/20.
//  Copyright © 2020 PRIYANS. All rights reserved.
//

import Foundation
public enum APIError: Error {
    case invalidJSON
    case dataError
    case httpError(error: Error)
    case urlError
    
    public var stringErrorValue: String {
        switch self {
        case let .httpError(error):
            return error.localizedDescription
        default:
            return "Something went wrong. Please try again later."
        }
    }
}
