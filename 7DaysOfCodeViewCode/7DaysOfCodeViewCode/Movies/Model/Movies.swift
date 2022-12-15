//
//  Movies.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 15/12/22.
//

import Foundation

struct MovieResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let title: String
    let overview: String
    let poster_path: String
    let release_date: String
    let vote_average: Double
}
