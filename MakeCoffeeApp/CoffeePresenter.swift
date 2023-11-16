//
//  CoffeePresenter.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation

protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func selectedCoffeeType(type : String) -> String
    func interactorDidDownloadData<T:Codable>(result : Result<T,Error>)
}

class CoffeePresenter : AnyPresenter {
    
    var coffetype: String = "" {
            didSet {
                if !coffetype.isEmpty {
                    print("coffetype ayarlandı")
                    setInteractor()
                } else {
                    print("coffetype boş, Interactor atanmadı")
                }
            }
        }

        private func setInteractor() {
            if coffetype == "hot" {
                print("Interactor ayarlandı, getHotCoffee çağrılıyor")
                
                interactor?.getHotCoffee { result in
                    switch result {
                    case .success(let hot):
                        self.interactorDidDownloadData(result: .success(hot))
                    case .failure(let error):
                        print("getHotCoffee'de hata oluştu \(error.localizedDescription)")
                    }
                }
            } else if coffetype == "cold" {
                print("Interactor ayarlandı, getIcedCoffee çağrılıyor")
                interactor?.getIcedCoffee(completion: { result in
                    switch result {
                    case .success(let cold):
                        self.interactorDidDownloadData(result: .success(cold))
                    case .failure(let error):
                        print("getIcedCoffee'de hata oluştu \(error.localizedDescription)")
                    }
                })
            } else {
                print("Geçersiz coffetype değeri")
            }
        }

    
    func selectedCoffeeType(type: String) -> String {
        let mytype = type
        coffetype = mytype
        return coffetype
    }
   
    
    var hotcoffeeList : [HotCoffee] = []
    var coldcofeeList : [ColdCoffee] = []
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        
        didSet {
            if !coffetype.isEmpty {
                print("chosentype has come")
                if coffetype == "hot" {
                    print("Interactor set, calling getHotCoffee")
                    
                    interactor?.getHotCoffee { result in
                        switch result {
                        case .success(let hot):
                            self.interactorDidDownloadData(result: .success(hot))
                        case .failure(_):
                            print("Error in getHotCoffee")
                        }
                    }
                } else if coffetype == "cold" {
                    print("Interactor set, calling getIcedCoffee")
                    interactor?.getIcedCoffee(completion: { result in
                        switch result {
                        case .success(let cold):
                            self.interactorDidDownloadData(result: .success(cold))
                        case .failure(_):
                            print("Error in getIcedCoffee")
                        }
                    })
                }
            } else {
                print("coffetype is empty")
            }
            
        }
    }

    
    var view: AnyView?
    
    func interactorDidDownloadData<T>(result: Result<T, Error>) where T : Decodable, T : Encodable {
        switch result {
        case .success(let coffee):
            if let hotCoffee = coffee as? HotCoffee {
            //    view?.updateHot(with: [hotCoffee])
            }
            else if let coldCoffee = coffee as? ColdCoffee {
              //  view?.updateCold(with: [coldCoffee])
            }
        case .failure(let error):
            print(error)
            // view?.updateError(with: error.localizedDescription)
        }
    }
}
