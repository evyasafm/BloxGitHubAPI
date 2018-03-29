//
//  ViewController.swift
//  BloxGitHubAPI
//
//  Created by Evyasaf on 3/29/18.
//  Copyright © 2018 evya. All rights reserved.
//

import UIKit
import RxSwift

class BloxGitHubViewController: UIViewController {

    // Mark - Outlets
    
    @IBOutlet weak var repositoriesTableView: UITableView!
    
    // Mark - Internat properties
    
    var router: Router!
    
    var createRepositoryInteractor: CreateRepositoryInteractor!
    var editRepositoryInteractor: EditRepositoryInteractor!
    var deleteRepositoryInteractor: DeleteRepositoryInteractor!
    var fetchRepositoriesInteractor: FetchRepositoriesInteractor!
    
    // Mark - Private properties
    
    fileprivate var repositories: [FetchRepositoriesModel.ViewModel.RepositoryViewModel]? {
        didSet {
            repositoriesTableView.reloadData()
        }
    }
    
    // Mark - View Controller lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        [RepositoryCell.self].forEach(repositoriesTableView.register)
        BloxGitHubConfigurator.shared.configure(viewController: self)
        fetchRepositoriesInteractor.fetchRepositories(args: FetchRepositoriesModel.Args())
    }
    
    // Mark - Actions
    
    @IBAction func createRepositoryTap(_ sender: Any) {
        createRepositoryInteractor.CreateRepository(args: CreateRepositoryModel.Args(repositoryName: "New Repo"))
    }
    
    @IBAction func editRepositoryTap(_ sender: Any) {
        editRepositoryInteractor.editRepository(args: EditRepositoryModel.Args(repositoryName: "New Repo", repoId: 1, ownerId: 1))
    }
    
    @IBAction func deleteRepositoryTap(_ sender: Any) {
        deleteRepositoryInteractor.deleteRepository(args: DeleteRepositoryModel.Args(repoId: 1, ownerId: 1))
    }
}

extension BloxGitHubViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryCell.self.reuseID) as! RepositoryCell
        cell.repositoryTitle.text = repositories?[indexPath.row].name
        return cell
    }
    
}

extension BloxGitHubViewController: CreateRepositoryView {
    
    func displayRepositoryCreated(repository: CreateRepositoryModel.ViewModel) {
        fetchRepositoriesInteractor.fetchRepositories(args: FetchRepositoriesModel.Args())
    }
    
    func displayRepositoryCreatedError(errorMessage: String) {
        
    }
    
}


extension BloxGitHubViewController: EditRepositoryView {
    
    func displayRepositoryEdited(repository: EditRepositoryModel.ViewModel) {
        fetchRepositoriesInteractor.fetchRepositories(args: FetchRepositoriesModel.Args())
    }
    
    func displayRepositoryEditedError(errorMessage: String) {
        
    }
    
}


extension BloxGitHubViewController: DeleteRepositoryView {
    
    func displayRepositoryDeleted() {
        fetchRepositoriesInteractor.fetchRepositories(args: FetchRepositoriesModel.Args())
    }
    
    func displayRepositoryDeletedError(error: Error) {
        
    }
    
}

extension BloxGitHubViewController: FetchRepositoriesView {

    func displayFetchedRepositories(repositories repositoriesViewModel: FetchRepositoriesModel.ViewModel) {
        repositories = repositoriesViewModel.repositories
    }
    
    func displayFetchRepositoriesError(error: Error) {
        
    }
    
}
