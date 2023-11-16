//
//  CoffeeRouter.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation
import UIKit

typealias EntryPoint = UIViewController & AnyView

protocol AnyRouter {
    
    var entryPoint : EntryPoint? {get}
    static func startExecution() -> AnyRouter
}

class CoffeeRouter : AnyRouter {
    var entryPoint: EntryPoint?
    
    static func startExecution() -> AnyRouter {
        let router = CoffeeRouter()
        
        var onboardingView : AnyView = OnboardingView()
        var view: AnyView = CoffeeView()
        var presenter: AnyPresenter = CoffeePresenter()
        var interactor: AnyInteractor = CoffeeInteractor()

        print("Interactor başlatılıyor...")
        print("Interactor başlatıldı: \(interactor)")

        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        view.presenter = presenter

        router.entryPoint = onboardingView as? EntryPoint

        print("Router başlatılıyor...")
        print("Router başlatıldı: \(router)")

        return router
    }

    
    
}
