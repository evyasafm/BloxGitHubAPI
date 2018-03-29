//
//  BloxNetworkService.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Moya
import RxSwift

protocol BloxNetworkService {
    
    func fetchRepositories() -> Observable<[RepositoryModel]>
    func createRepository(name: String) -> Observable<RepositoryModel>
    func editRepository(name: String, repoId: Int, ownerId: Int) -> Observable<RepositoryModel>
    func deleteRepository(repoId: Int, ownerId: Int) -> Observable<Bool>
    
}

class BloxNetworkServiceHandler: BloxNetworkService {
    
    static let shared: BloxNetworkService = { BloxNetworkServiceHandler() }()
    
    private let provider: MoyaProvider<BloxTargetType>
    private var username: String = "evyasafmtest"
    private var password: String = "Aa123456"
    
    private init() {
        provider = MoyaProvider<BloxTargetType>(callbackQueue: DispatchQueue.global(),
                                              manager: MoyaProvider<BloxTargetType>.defaultAlamofireManager(),
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
    
    func editRepository(name: String, repoId: Int, ownerId: Int) -> Observable<RepositoryModel> {
        return provider.rx
            .request(.editRepository(name: name, repoId: repoId, ownerId: ownerId))
            .filterSuccessfulStatusCodes()
            .map(RepositoryModel.self)
            .asObservable()
    }
    
    func deleteRepository(repoId: Int, ownerId: Int) -> Observable<Bool> {
        return provider.rx
            .request(.deleteRepository(repoId: repoId, ownerId: ownerId))
            .filterSuccessfulStatusCodes()
            .map({ _ in
                return true
            })
            .asObservable()
    }
    
}
