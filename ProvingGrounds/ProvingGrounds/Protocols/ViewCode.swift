//
//  ViewCode.swift
//  ProvingGrounds
//
//  Created by nicholas.r.babo on 29/01/19.
//  Copyright © 2019 Babo. All rights reserved.
//

import Foundation

protocol ViewCode{
    func setupViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension ViewCode {
    func setupView(){
        setupViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
