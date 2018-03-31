//
//  EditRepositoryInteractor.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift

protocol EditRepositoryInteractor {
    
    func editRepository(args: EditRepositoryModel.Args)
    
}

class EditRepositoryInteractorHandler: EditRepositoryInteractor {
    
    var presenter: EditRepositoryPresenter!
    
    private let bloxNetworkService: BloxNetworkService
    private let bag = DisposeBag()
    
    init(bloxNetworkService: BloxNetworkService = BloxNetworkServiceHandler.shared) {
        self.bloxNetworkService = bloxNetworkService
    }
    
    func editRepository(args: EditRepositoryModel.Args) {
        bloxNetworkService
            .editRepository(name: args.repositoryName, repoName: args.repoName, ownerName: args.ownerName)
            .subscribe(onNext: { (repositoryModel: RepositoryModel) in
                self.presenter.presentRepositoryModel(response: EditRepositoryModel.Response(repositoryModel: repositoryModel))
            }, onError: { (error: Error) in
                self.presenter.presentError(error: error)
            })
            .disposed(by: bag)
    }
    
}

