//
//  DetailViewController.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 15/12/22.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: Properties
    var titleMovies: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        return label
    }()
    
    let labelRating: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 17, weight: .semibold)
        return label
    }()
    
    let textResume: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textColor = .white
        textView.font = .systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        return textView
    }()
    
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 39
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        setupContainer()
        setupConstraints()
    }
    
    // MARK: Methods
    private func setupContainer() {
        view.addSubview(titleMovies)
        view.addSubview(labelRating)
        view.addSubview(textResume)
        view.addSubview(imageMovie)
    }
    
    private func setupConstraints() {
        titleMovies.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        titleMovies.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        titleMovies.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        imageMovie.topAnchor.constraint(equalTo: titleMovies.bottomAnchor, constant: 30).isActive = true
        imageMovie.centerXAnchor.constraint(equalTo: titleMovies.centerXAnchor).isActive = true
        imageMovie.heightAnchor.constraint(equalToConstant: 235).isActive = true
        imageMovie.widthAnchor.constraint(equalToConstant: 176).isActive = true
        
        labelRating.topAnchor.constraint(equalTo: imageMovie.bottomAnchor, constant: 30).isActive = true
        labelRating.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30).isActive = true
        labelRating.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30).isActive = true
        
        textResume.topAnchor.constraint(equalTo: labelRating.bottomAnchor, constant: 30).isActive = true
        textResume.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        textResume.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        textResume.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10).isActive = true
    }
}
