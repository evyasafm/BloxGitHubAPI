//
//  DeleteRepositoryPresenter.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation


protocol DeleteRepositoryPresenter {
    
    func presentRepositoryModelDeleted()
    func presentError(error: Error)
    
}

class DeleteRepositoryPresenterHandler: DeleteRepositoryPresenter {
    
    weak var view: DeleteRepositoryView?
    
    func presentRepositoryModelDeleted() {
        DispatchQueue.main.async {
            self.view?.displayRepositoryDeleted()
        }
    }
    
    func presentError(error: Error) {
        DispatchQueue.main.async {
            // TODO: Should support View model errors
            self.view?.displayRepositoryDeletedError(error: error)
        }
    }
    
}
