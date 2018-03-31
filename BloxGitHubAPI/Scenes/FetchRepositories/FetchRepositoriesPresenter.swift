//
//  FetchRepositoriesPresenter.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation


protocol FetchRepositoriesPresenter {
    
    func presentFetchedRepositories(repositories: FetchRepositoriesModel.Response)
    func presentFetchRepositoriesError(error: Error)
    
}

class FetchRepositoriesPresenterHandler: FetchRepositoriesPresenter {
    
    weak var view: FetchRepositoriesView?
    
    func presentFetchedRepositories(repositories: FetchRepositoriesModel.Response) {
        let repositoriesVM = repositories.repositories.map { (repository: RepositoryModel) -> FetchRepositoriesModel.ViewModel.RepositoryViewModel in
            let editRepositoryArgs = EditRepositoryModel.Args(repositoryName: repository.name, repoName: repository.name, ownerName: repository.owner.login)
            let deleteRepositoryArgs = DeleteRepositoryModel.Args(repoName: repository.name, ownerName: repository.owner.login)
            return FetchRepositoriesModel.ViewModel.RepositoryViewModel(name: repository.name,
                                                                        editRepositoryArgs: editRepositoryArgs,
                                                                        deleteRepositoryArgs: deleteRepositoryArgs)
        }
        DispatchQueue.main.async {
            self.view?.displayFetchedRepositories(repositories: FetchRepositoriesModel.ViewModel(repositories: repositoriesVM))
        }
    }
    
    func presentFetchRepositoriesError(error: Error) {
        DispatchQueue.main.async {
            // TODO: Should support View model errors
            self.view?.displayFetchRepositoriesError(error: error)
        }
    }
    
}
