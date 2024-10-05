//
//  Extensions.swift
//  RickAndMorty
//
//  Created by THL_Mac on 9/25/24.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach({
            addSubview($0)
        })
    }
}
