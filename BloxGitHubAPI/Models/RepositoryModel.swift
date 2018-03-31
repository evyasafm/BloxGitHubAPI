//
//  RepositoryModel.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import Foundation

class RepositoryModel: Decodable {
    
    let name: String
    let id: Int
    let owner: OwnerModel
    
}
