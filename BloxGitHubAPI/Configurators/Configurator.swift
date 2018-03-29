//
//  Configurator.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

class BloxGitHubConfigurator {
    
    static let shared: BloxGitHubConfigurator = { BloxGitHubConfigurator() }()
    
    // MARK: Configuration
    
    func configure(viewController: BloxGitHubViewController) {
        let router = Router()
        router.viewController = viewController
        viewController.router = router
        
        configureCreateRepository(viewController: viewController)
        configureEditRepository(viewController: viewController)
        configureDeleteRepository(viewController: viewController)
        configureFetchRepository(viewController: viewController)
    }
    
    // Mark - Private methods
    
    private func configureCreateRepository(viewController: BloxGitHubViewController) {
        let presenter = CreateRepositoryPresenterHandler()
        presenter.view = viewController
        
        let interactor = CreateRepositoryInteractorHandler()
        interactor.presenter = presenter
        
        viewController.createRepositoryInteractor = interactor
    }
    
    private func configureEditRepository(viewController: BloxGitHubViewController) {
        let presenter = EditRepositoryPresenterHandler()
        presenter.view = viewController
        
        let interactor = EditRepositoryInteractorHandler()
        interactor.presenter = presenter
        
        viewController.editRepositoryInteractor = interactor
    }
    
    private func configureDeleteRepository(viewController: BloxGitHubViewController) {
        let presenter = DeleteRepositoryPresenterHandler()
        presenter.view = viewController
        
        let interactor = DeleteRepositoryInteractorHandler()
        interactor.presenter = presenter
        
        viewController.deleteRepositoryInteractor = interactor
    }
    
    private func configureFetchRepository(viewController: BloxGitHubViewController) {
        let presenter = FetchRepositoriesPresenterHandler()
        presenter.view = viewController
        
        let interactor = FetchRepositoriesInteractorHandler()
        interactor.presenter = presenter
        
        viewController.fetchRepositoriesInteractor = interactor
    }
    
}
