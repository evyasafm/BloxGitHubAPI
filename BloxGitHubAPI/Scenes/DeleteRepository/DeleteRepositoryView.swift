//
//  DeleteRepositoryView.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

protocol DeleteRepositoryView: class {
    
    func displayRepositoryDeleted()
    func displayRepositoryDeletedError(error: Error)
    
}
