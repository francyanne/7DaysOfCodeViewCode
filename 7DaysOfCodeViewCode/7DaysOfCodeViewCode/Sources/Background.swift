//
//  File.swift
//  7DaysOfCodeViewCode
//
//  Created by Fran Martins on 15/12/22.
//

import UIKit

extension UIViewController {
    func setGradientBackground() {
        let colorTop =  UIColor(red: 46.0/255.0, green: 19/255.0, blue: 113.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 19/255.0, green: 11/255.0, blue: 43/255.0, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
        
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
