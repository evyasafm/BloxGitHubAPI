//
//  FetchRepositoriesInteractor.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

import RxSwift

protocol FetchRepositoriesInteractor {
    
    func fetchRepositories(args: FetchRepositoriesModel.Args)
    
}

class FetchRepositoriesInteractorHandler: FetchRepositoriesInteractor {
    
    var presenter: FetchRepositoriesPresenter!
    
    private let bloxNetworkService: BloxNetworkService
    private let bag = DisposeBag()
    
    init(bloxNetworkService: BloxNetworkService = BloxNetworkServiceHandler.shared) {
        self.bloxNetworkService = bloxNetworkService
    }
    
    func fetchRepositories(args: FetchRepositoriesModel.Args) {
        bloxNetworkService
            .fetchRepositories()
            .subscribe(onNext: { (repositories) in
                self.presenter.presentFetchedRepositories(repositories: FetchRepositoriesModel.Response(repositories: repositories))
            }, onError: { (error: Error) in
                self.presenter.presentFetchRepositoriesError(error: error)
            })
            .disposed(by: bag)
    }
    
}
