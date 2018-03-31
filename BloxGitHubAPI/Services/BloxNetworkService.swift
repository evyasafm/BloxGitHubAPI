//
//  BloxNetworkService.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya
import Alamofire
import RxSwift

protocol BloxNetworkService {
    
    func fetchRepositories() -> Observable<[RepositoryModel]>
    func createRepository(name: String) -> Observable<RepositoryModel>
    func editRepository(name: String, repoName: String, ownerName: String) -> Observable<RepositoryModel>
    func deleteRepository(repoName: String, ownerName: String) -> Observable<Bool>
    
}

class BloxNetworkServiceHandler: BloxNetworkService {
    
    static let shared: BloxNetworkService = { BloxNetworkServiceHandler() }()
    
    private let provider: MoyaProvider<BloxTargetType>
    
    // For simplicity - use credentials in the service class
    private var username: String = "evyasafmtest"
    private var password: String = "Aa123456"
    
    private init() {
        let manager = MoyaProvider<BloxTargetType>.defaultAlamofireManager()
        manager.session.configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        provider = MoyaProvider<BloxTargetType>(callbackQueue: DispatchQueue.global(),
                                              manager: manager,
                                              plugins: [NetworkLoggerPlugin(verbose: true),
                                                        BasicAuthenticationPlugin(key: "\(username):\(password)")]
        )
    }
    
    // MARK: NetworkClient Implementation
    
    func fetchRepositories() -> Observable<[RepositoryModel]> {
        return provider.rx
            .request(.fetchRepositories())
            .filterSuccessfulStatusCodes()
            .map([RepositoryModel].self)
            .asObservable()
    }
    
    func createRepository(name: String) -> Observable<RepositoryModel> {
        return provider.rx
            .request(.createRepository(name: name))
            .filterSuccessfulStatusCodes()
            .map(RepositoryModel.self)
            .asObservable()
    }
    
    func editRepository(name: String, repoName: String, ownerName: String) -> Observable<RepositoryModel> {
        return provider.rx
            .request(.editRepository(name: name, repoName: repoName, ownerName: ownerName))
            .filterSuccessfulStatusCodes()
            .map(RepositoryModel.self)
            .asObservable()
    }
    
    func deleteRepository(repoName: String, ownerName: String) -> Observable<Bool> {
        return provider.rx
            .request(.deleteRepository(repoName: repoName, ownerName: ownerName))
            .filterSuccessfulStatusCodes()
            .map({ _ in
                return true
            })
            .asObservable()
    }
    
}
