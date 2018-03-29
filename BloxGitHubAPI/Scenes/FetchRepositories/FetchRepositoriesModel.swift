//
//  FetchRepositoriesModel.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

enum FetchRepositoriesModel {
    
    struct Args {
     
    }
    
    struct Response {
        let repositories: [RepositoryModel]
    }
    
    struct ViewModel {
        struct RepositoryViewModel {
            
            var name: String
            
        }
        let repositories: [RepositoryViewModel]
    }
    
}
