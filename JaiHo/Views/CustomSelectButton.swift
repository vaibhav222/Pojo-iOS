//
//  CustomSelectButton.swift
//  JaiHo
//
//  Created by Barchhiha, Vaibhav on 10/02/20.
//  Copyright © 2020 Barchhiha, Vaibhav. All rights reserved.
//

import UIKit

//@IBDesignable
class CustomSelectButton: UIButton {

    private var _isSelected = false
    override var isSelected: Bool {
        get {
            return _isSelected
        }
        set(newValue) {
            if newValue == true {
//                let image = UIImage(named: "confirmation.png")!
//                setImage(image, for: .normal)
                backgroundColor = UIColor.init(red: 149/256, green: 203/256, blue: 96/256, alpha: 1.0)
            } else {
//                setImage(nil, for: UIControl.State())
                backgroundColor = UIColor.white
            }
            _isSelected = newValue
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = bounds.width / 2
    }     
}
