//
//  APIError.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 15/12/22.
//

import Foundation

enum APIError: Error {
    case badURL
    case badData
    case parseError
    case unknown
}
