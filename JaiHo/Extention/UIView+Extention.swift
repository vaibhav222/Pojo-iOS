//
//  UIView+Extention.swift
//  JaiHo
//
//  Created by Barchhiha, Vaibhav on 19/02/20.
//  Copyright © 2020 Barchhiha, Vaibhav. All rights reserved.
//

import UIKit

extension UIView {
    func makeRoundedView(withBorderColor color: UIColor = UIColor.init(red: 237.0/255.0, green: 155.0/255.0, blue: 81.0/255.0, alpha: 1),
        width: CGFloat)
    {
        self.layer.cornerRadius = 10.0
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
