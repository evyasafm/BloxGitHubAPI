//
//  EditRepositoryPresenter.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol EditRepositoryPresenter {
    
    func presentRepositoryModel(response: EditRepositoryModel.Response)
    func presentError(error: Error)
    
}

class EditRepositoryPresenterHandler: EditRepositoryPresenter {
    
    weak var view: EditRepositoryView?
    
    func presentRepositoryModel(response: EditRepositoryModel.Response) {
        let repositoryName = response.repositoryModel.name ?? "Repository Empty Name"
        let repositoryVM = EditRepositoryModel.ViewModel.RepositoryViewModel(name: repositoryName)
        DispatchQueue.main.async {
            self.view?.displayRepositoryEdited(repository: EditRepositoryModel.ViewModel(repository: repositoryVM))
        }
    }
    
    func presentError(error: Error) {
        DispatchQueue.main.async {
            // TODO: Should support View model errors
            self.view?.displayRepositoryEditedError(errorMessage: "Error")
        }
    }
    
}
