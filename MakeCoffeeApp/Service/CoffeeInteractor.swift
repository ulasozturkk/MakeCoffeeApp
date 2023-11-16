//
//  CoffeeInteractor.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation


protocol AnyInteractor {
    var presenter : AnyPresenter? {get set}
    func getHotCoffee(completion: @escaping (Result<[HotCoffee], Error>) -> ())
    func getIcedCoffee(completion: @escaping (Result<[ColdCoffee], Error>) -> ())

}

class CoffeeInteractor : AnyInteractor{
    

    
    var presenter: AnyPresenter?
    func getDataFromApi<T>(_ endpoint : endPoint,completion : @escaping (Result<T,Error>) -> ()) where T : Codable{
        
        let task = URLSession.shared.dataTask(with: endpoint.request()) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let response = response as? HTTPURLResponse, response.statusCode >= 200 && response.statusCode <= 299 else {
                completion(.failure(NSError(domain: "Invalid response", code: 0)))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "data error", code: 0)))
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let error{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getHotCoffee(completion : @escaping (Result<[HotCoffee],Error>) -> () ){
        print("hot coffe ")
        getDataFromApi(endPoint.hot, completion: completion)
    }
    func getIcedCoffee(completion: @escaping (Result<[ColdCoffee], Error>) -> ()) {
        getDataFromApi(endPoint.iced, completion: completion)
    }
    
}
