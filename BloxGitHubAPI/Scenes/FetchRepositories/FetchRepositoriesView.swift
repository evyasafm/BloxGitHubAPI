//
//  FetchRepositoriesView.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol FetchRepositoriesView: class {
    
    func displayFetchedRepositories(repositories: FetchRepositoriesModel.ViewModel)
    func displayFetchRepositoriesError(error: Error)
    
}
