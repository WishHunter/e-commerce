//
//  RegistrationPresenter.swift
//  e-commerce
//
//  Created by Denis Molkov on 26.09.2021.
//

import Foundation

class RegistrationPresenter: RegistrationViewPresenter {
    let view: RegistrationView
    
    required init(view: RegistrationView) {
        self.view = view
    }
}
