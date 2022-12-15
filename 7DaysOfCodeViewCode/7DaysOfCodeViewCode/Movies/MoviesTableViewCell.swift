//
//  MoviesTableViewCell.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 14/12/22.
//

import UIKit
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    // MARK: Properties
    static let identifier = "cell"
    
    let imageMovie: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "clean-code")
        image.layer.cornerRadius = 18
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let labelName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelLaunch: UILabel = {
        let label = UILabel()
        label.alpha = 0.75
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        contentView.addSubview(imageMovie)
        contentView.addSubview(labelName)
        contentView.addSubview(labelLaunch)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupConstraints()
    }
    
    func setupUI(model: Movie) {
        labelName.text = model.title
        labelLaunch.text = "Lançamento: \(model.release_date)"
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(model.poster_path)")
        imageMovie.kf.setImage(with: url)
    }
    
    private func setupConstraints() {
        imageMovie.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        imageMovie.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        imageMovie.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageMovie.widthAnchor.constraint(equalToConstant: 90).isActive = true
        
        labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50).isActive = true
        labelName.leadingAnchor.constraint(equalTo: imageMovie.trailingAnchor, constant: 20).isActive = true
        labelName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        
        labelLaunch.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 8).isActive = true
        labelLaunch.leadingAnchor.constraint(equalTo: imageMovie.trailingAnchor, constant: 20).isActive = true
        labelLaunch.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
}
