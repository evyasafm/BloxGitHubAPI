//
//  BloxTargetType.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import Moya
import EVReflection

enum BloxTargetType {
    
    case fetchRepositories()
    case createRepository(name: String)
    case editRepository(name: String, repoName: String, ownerName: String)
    case deleteRepository(repoName: String, ownerName: String)

}

extension BloxTargetType: TargetType {
    
    public var baseURL: URL { return URL(string: "https://api.github.com")! }
    
    public var path: String {
        switch self {
        case .fetchRepositories:
            return "/user/repos"
        case .createRepository:
            return "/user/repos"
        case .editRepository(_, let repoId, let ownerId):
            return "/repos/\(ownerId)/\(repoId)"
        case .deleteRepository(let repoId, let ownerId):
            return "/repos/\(ownerId)/\(repoId)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchRepositories:
            return .get
        case .createRepository:
            return .post
        case .editRepository:
            return .patch
        case .deleteRepository:
            return .delete
        }
    }
    
    public var task: Task {
        switch self {
        case .fetchRepositories:
            return .requestPlain
        case .createRepository(let name):
            return .requestParameters(parameters: ["name" : name], encoding: JSONEncoding.default)
        case .editRepository(let name,_,_):
            return .requestParameters(parameters: ["name" : name], encoding: JSONEncoding.default)
        case .deleteRepository:
            return .requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var sampleData: Data {
        switch self {
        case .fetchRepositories:
            return "[{}]".data(using: String.Encoding.utf8)!
        case .createRepository, .deleteRepository, .editRepository:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    
    public var headers: [String: String]? {
        return nil
    }
    
}

struct BasicAuthenticationPlugin: PluginType {
    
    let key: String
    
    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        guard let data = key.data(using: String.Encoding.utf8) else {
            return request
        }
        let base64 = data.base64EncodedString()
        var request = request
        request.addValue("Basic " + base64, forHTTPHeaderField: "Authorization")
        return request
    }
}
