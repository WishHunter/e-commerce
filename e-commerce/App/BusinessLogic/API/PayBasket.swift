//
//  PayBasket.swift
//  e-commerce
//
//  Created by Denis Molkov on 10.10.2021.
//

import Foundation

class PayBasket: PayBasketAPIFactory {
    let requestFactory = RequestFactory()
        
    func payBasket() {
        let getBasket = requestFactory.getBasketRequestFactory()
        
        getBasket.getBasket(idUser: 1) { [weak self] response in
            guard let self = self else { return }
            
            switch response.result {
            case .success(let answer):
                
                if self.tryToPay() {
                    self.clearBasket(basket: answer.contents)
                } else {
                    print("error pay")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func tryToPay() -> Bool {
        return true
    }

    func clearBasket(basket: [ProductInBasket]) -> Bool {
        let deleteFromBasket = requestFactory.deleteFromBasketRequestFactory()

        for product in basket {
            let idProduct = product.idProduct

            deleteFromBasket.deleteFromBasket(idProduct: idProduct) { response in
                switch response.result {
                case .success(_):
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                } 
            }
        }
    }
}
