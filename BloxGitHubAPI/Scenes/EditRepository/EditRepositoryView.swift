//
//  editRepositoryView.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol EditRepositoryView: class {
    
    func displayRepositoryEdited(repository: EditRepositoryModel.ViewModel)
    func displayRepositoryEditedError(errorMessage: String)
    
}
