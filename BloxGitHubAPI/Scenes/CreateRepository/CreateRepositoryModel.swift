//
//  CreateRepositoryModel.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

enum CreateRepositoryModel {
    
    struct Args {
        let repositoryName: String
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
