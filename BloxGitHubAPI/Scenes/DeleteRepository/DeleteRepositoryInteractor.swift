//
//  DeleteRepositoryInteractor.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation
import RxSwift

protocol DeleteRepositoryInteractor {
    
    func deleteRepository(args: DeleteRepositoryModel.Args)
    
}

class DeleteRepositoryInteractorHandler: DeleteRepositoryInteractor {
    
    var presenter: DeleteRepositoryPresenter!
    
    private let bloxNetworkService: BloxNetworkService
    private let bag = DisposeBag()
    
    init(bloxNetworkService: BloxNetworkService = BloxNetworkServiceHandler.shared) {
        self.bloxNetworkService = bloxNetworkService
    }
    
    func deleteRepository(args: DeleteRepositoryModel.Args) {
        bloxNetworkService
            .deleteRepository(repoName: args.repoName, ownerName: args.ownerName)
            .subscribe(onNext: { (_) in
                self.presenter.presentRepositoryModelDeleted()
            }, onError: { (error: Error) in
                self.presenter.presentError(error: error)
            })
            .disposed(by: bag)
    }
    
}

