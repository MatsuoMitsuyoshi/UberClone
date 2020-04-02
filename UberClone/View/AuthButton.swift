//
//  AuthButton.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/02.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

import UIKit

class AuthButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
        backgroundColor = .mainBlueTint
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
