//
//  Router.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit

extension BloxGitHubViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router.passDataToNextScene(segue: segue)
    }
    
}

class Router {
    
    weak var viewController: BloxGitHubViewController!
    
    // MARK: Navigation
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        
    }
    
}
