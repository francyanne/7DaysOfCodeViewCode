//
//  MoviesViewModel.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 15/12/22.
//

import Foundation

class MoviesViewModel {
    // MARK: Properties
    private let accessToken = "2f1bc518848a880f44224016a08fd99b"
    var didSuccess: ((MovieResults) -> Void)?
    var didFailure: ((APIError) -> Void)?
    
    // MARK: Service
    func fetchPopularMovies(completion: @escaping ((Result<MovieResults,APIError>) -> Void)) {
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=\(accessToken)") else { return }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                print(response.statusCode)
            }
            
            guard let data = data else { return }
            guard let movies = try? JSONDecoder().decode(MovieResults.self, from: data) else { return }
            completion(.success(movies))
        }.resume()
    }
    
    func getMovies() {
        fetchPopularMovies { [weak self] result in
            switch result {
            case .success(let success):
                self?.didSuccess?(success)
            case .failure(let failure):
                self?.didFailure?(failure)
            }
        }
    }
}
