//
//  EditRepositoryModel.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

enum EditRepositoryModel {
    
    struct Args {
        var repositoryName: String
        let repoName: String
        let ownerName: String
    }
    
    struct Response {
        let repositoryModel: RepositoryModel
    }
    
    struct ViewModel {
        struct RepositoryViewModel {
            
            var name: String
            
        }
        let repository: RepositoryViewModel
    }
    
}
