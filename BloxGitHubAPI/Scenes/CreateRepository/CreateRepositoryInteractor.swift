//
//  CreateRepositoryInteractor.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift

protocol CreateRepositoryInteractor {
    
    func createRepository(args: CreateRepositoryModel.Args)
    
}

class CreateRepositoryInteractorHandler: CreateRepositoryInteractor {
    
    var presenter: CreateRepositoryPresenter!
    
    private let bloxNetworkService: BloxNetworkService
    private let bag = DisposeBag()
    
    init(bloxNetworkService: BloxNetworkService = BloxNetworkServiceHandler.shared) {
        self.bloxNetworkService = bloxNetworkService
    }
    
    func createRepository(args: CreateRepositoryModel.Args) {
        bloxNetworkService
            .createRepository(name: args.repositoryName)
            .subscribe(onNext: { (repositoryModel: RepositoryModel) in
                self.presenter.presentRepositoryModel(response: CreateRepositoryModel.Response(repositoryModel: repositoryModel))
            }, onError: { (error: Error) in
                self.presenter.presentError(error: error)
            })
            .disposed(by: bag)
    }
    
}

