//
//  CoffeeInteractor.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation


protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
}

class CoffeeInteractor : AnyInteractor{
    var presenter: AnyPresenter?
    
    
}
