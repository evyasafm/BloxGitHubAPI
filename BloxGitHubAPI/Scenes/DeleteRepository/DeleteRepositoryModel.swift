//
//  EditRepositoryModel.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation


enum DeleteRepositoryModel {
    
    struct Args {
        let repoId: Int
        let ownerId: Int
    }
    
    struct Response {
        let isSuccess: Bool
    }
    
    struct ViewModel {
        
    }
    
}
