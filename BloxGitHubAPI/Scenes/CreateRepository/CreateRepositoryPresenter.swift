//
//  CreateRepositoryPresenter.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol CreateRepositoryPresenter {
    
    func presentRepositoryModel(response: CreateRepositoryModel.Response)
    func presentError(error: Error)
    
}

class CreateRepositoryPresenterHandler: CreateRepositoryPresenter {
    
    weak var view: CreateRepositoryView?
    
    func presentRepositoryModel(response: CreateRepositoryModel.Response) {
        let repositoryVM = CreateRepositoryModel.ViewModel.RepositoryViewModel(name: response.repositoryModel.name)
        DispatchQueue.main.async {
            self.view?.displayRepositoryCreated(repository: CreateRepositoryModel.ViewModel(repository: repositoryVM))
        }
    }
    
    func presentError(error: Error) {
        DispatchQueue.main.async {
            // TODO: Should support View model errors
            self.view?.displayRepositoryCreatedError(errorMessage: "Error")
        }
    }
    
}

