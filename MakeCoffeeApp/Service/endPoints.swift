//
//  endPoints.swift
//  MakeCoffeeApp
//
//  Created by macbook pro on 16.11.2023.
//

import Foundation

// https://api.sampleapis.com/coffee/hot

enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case patch = "PATCH"
}

enum endPoint {
    case hot
    case iced
}

protocol EndPointProtocol {
    var baseURL : String {get}
    var path : String {get}
    var method : HTTPMethod {get}
    var headers : [String : String]? {get}
    
    func request() -> URLRequest
}

extension endPoint : EndPointProtocol {
    var baseURL: String {
        return "https://api.sampleapis.com/coffee"
    }
    
    var path: String {
        switch self {
        case .hot:
            return "/hot"
        case .iced:
            return "/iced"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .iced:
            return HTTPMethod.get
        case .hot:
            return HTTPMethod.get
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    func request() -> URLRequest {
        guard var component = URLComponents(string: baseURL) else {
            fatalError("url error")
        }
        component.path = path
        
        var request = URLRequest(url: component.url!)
        request.httpMethod = method.rawValue
        
        if let headers = headers {
            for (key,value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
    
    
    
}
