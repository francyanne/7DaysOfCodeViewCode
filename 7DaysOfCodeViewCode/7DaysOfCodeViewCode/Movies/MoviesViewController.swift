//
//  ViewController.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 14/12/22.
//

import UIKit

class MoviesViewController: UIViewController {
    // MARK: Properties
    let viewModel = MoviesViewModel()
    var movies: MovieResults?
    
    let titleView: UILabel = {
        let label = UILabel()
        label.text = "Filmes Populares"
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let tableViewMovies: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 150
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getMovies()
        bindEvents()
        setContainer()
        setConstraints()
        setGradientBackground()
        setupTableView()
    }
    
    private func setupTableView() {
        tableViewMovies.delegate = self
        tableViewMovies.dataSource = self
        tableViewMovies.register(MoviesTableViewCell.self, forCellReuseIdentifier: "cell")
        tableViewMovies.separatorStyle = .none
    }
    
    private func bindEvents() {
        viewModel.didSuccess = { [weak self] model in
            self?.movies = model
            DispatchQueue.main.async {
                self?.tableViewMovies.reloadData()
            }
        }
    }
    
    private func setContainer() {
        view.addSubview(titleView)
        view.addSubview(tableViewMovies)
    }
    
    private func setConstraints() {
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        titleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40).isActive = true
        titleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40).isActive = true
        
        tableViewMovies.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 30).isActive = true
        tableViewMovies.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        tableViewMovies.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        tableViewMovies.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies?.results.count ?? 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewMovies.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MoviesTableViewCell
        guard let movies = movies?.results[indexPath.row] else { return cell ?? UITableViewCell() }
        cell?.setupUI(model: movies)
        cell?.backgroundColor = .clear
        return cell ?? UITableViewCell()
    }
}
