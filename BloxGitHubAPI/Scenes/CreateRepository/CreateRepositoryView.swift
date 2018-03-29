//
//  CreateRepositoryView.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol CreateRepositoryView: class {
    
    func displayRepositoryCreated(repository: CreateRepositoryModel.ViewModel)
    func displayRepositoryCreatedError(errorMessage: String)
    
}
