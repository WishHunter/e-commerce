//
//  AppDelegate.swift
//  e-commerce
//
//  Created by Denis Molkov on 19.09.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let requestFactory = RequestFactory()
    let apiFactory = APIFactory()

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let auth = requestFactory.makeAuthRequestFatory()
        let catalog = requestFactory.makeCatalogRequestFactory()
        let addReview = requestFactory.addReviewRequestFactory()
        let removeReview = requestFactory.removeReviewRequestFactory()
        let addToBasket = requestFactory.addToBasketRequestFactory()
        let deleteFromBasket = requestFactory.deleteFromBasketRequestFactory()
        
        let payBasket = apiFactory.payBusket()

        auth.login(userName: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let login):
                print(login)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        catalog.getCatalog(pageNumber: 1) { response in
            switch response.result {
            case .success(let catalog):
                print(catalog)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        addReview.addReview(idUser: 123, comment: "Some comment") { response in
            switch response.result {
            case .success(let answer):
                print(answer.userMessage)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        removeReview.removeReview(idComment: 123) { response in
            switch response.result {
            case .success(let answer):
                print(answer.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        addToBasket.addToBasket(idProduct: 123, quantity: 1) { response in
                switch response.result {
                case .success(let answer):
                    print(answer.result)
                case .failure(let error):
                    print(error.localizedDescription)
                }
        }

        deleteFromBasket.deleteFromBasket(idProduct: 123) { response in
            switch response.result {
            case .success(let answer):
                print(answer.result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

        payBasket.payBasket()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
