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
    
    var coffetype: String = "" 

    func selectedCoffeeType(type: String) -> String {
            let mytype = type
            coffetype = mytype
            
            // Debug print ekleyerek kontrol et
            print("selectedCoffeeType called with coffetype: \(coffetype)")

            // coffetype'ı ayarlamak ve interactor'ı çağırmak için setInteractor fonksiyonunu çağırın
            setInteractor()
            
            return coffetype
        }
        
        private func setInteractor() {
            // Debug print ekleyerek kontrol et
            print("setInteractor called with coffetype: \(coffetype)")

            if coffetype == "hot" {
                print("Interactor ayarlandı, getHotCoffee çağrılıyor")
                guard let interactor = interactor else {
                        print("Interactor is nil!")
                        return
                    }
                interactor.getHotCoffee { result in
                    print("gethotcoffee çağrıldı")
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
   
    
    var hotcoffeeList : [HotCoffee] = []
    var coldcofeeList : [ColdCoffee] = []
    var router: AnyRouter?
    
    var interactor: AnyInteractor?
    

    
    var view: AnyView?
    
    func interactorDidDownloadData<T>(result: Result<T, Error>) where T : Decodable, T : Encodable {
        switch result {
        case .success(let coffee):
            if let hotCoffee = coffee as? HotCoffee {
               view?.updateHot(with: [hotCoffee])
            }
            else if let coldCoffee = coffee as? ColdCoffee {
                view?.updateIced(with: [coldCoffee])
            }
        case .failure(let error):
            print(error)
            // view?.updateError(with: error.localizedDescription)
        }
    }
}
