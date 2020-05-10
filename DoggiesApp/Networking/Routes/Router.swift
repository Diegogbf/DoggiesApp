////
////  Router.swift
////  base-ios
////
////  Created by Diego Gomes on 20/01/20.
////  Copyright © 2020 Diego Gomes. All rights reserved.
////
//
import Foundation

enum Router {
    case getFeed(request: Feed)
    case signup(request: User)
}

extension Router: EndPointType {
    var baseURL: URL {
        return URL(string: apiURL)!
    }
    
    var path: String {
        switch self {
        case .getFeed:
            return EndPoint.feed.rawValue
        case .signup:
            return EndPoint.signup.rawValue
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .getFeed:
            return .get
        case .signup:
            return .post
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .getFeed(let request):
            return .requestParameters(bodyParameters: nil, urlParameters: request.dictionary)
        case .signup(let request):
            return .requestParameters(bodyParameters: request.dictionary, urlParameters: nil)
        }
    }
    
    var headers: HTTPHeaders? {
        
        switch self {
        case .getFeed:
            return ["Authorization": LocalPersistence.shared[.accessToken]]
        default:
            return nil
        }
    }
}

