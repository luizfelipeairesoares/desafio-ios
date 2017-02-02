//
//  RepositoryViewModel.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation

protocol RepositoryProtocol: class, ControllersProtocol {
    
    func reloadTable()
    
}

class RepositoryViewModel {
    
    weak var controller: RepositoryProtocol?
    
    func assignController(controller: RepositoryProtocol) {
        self.controller = controller
    }
    
    var currentPage: Int = 0
    
    var repositories: [RepositoryEntity] = []
    
    var currentRepository: RepositoryEntity?
    
    var prs: [PullRequestEntity] = []
    
    private var isRequestingRepositories: Bool = false
    
    // MARK: - Requests
    
    internal func requestRepositories() {
        if self.isRequestingRepositories == false {
            self.currentPage += 1
            self.isRequestingRepositories = true
            self.controller?.showLoading()
            SearchService().searchRepositories(page: self.currentPage) { [unowned self] (result) in
                switch result {
                case .success(let container):
                    if let items = container.items {
                        self.repositories.append(contentsOf: items)
                        self.controller?.reloadTable()
                    }
                    self.controller?.hideLoading()
                    self.isRequestingRepositories = false
                case .failure(let msg):
                    self.controller?.showAlert(message: msg)
                    self.isRequestingRepositories = false
                }
            }
        }
    }
    
    internal func requestPulls() {
        if let current = self.currentRepository, let full = current.fullName {
            self.controller?.showLoading()
            SearchService().requestPulls(repository: full, completion: { [unowned self] (result) in
                switch result {
                case .success(let pulls):
                    self.prs = pulls
                    self.controller?.reloadTable()
                    self.controller?.hideLoading()
                case .failure(let msg):
                    self.controller?.showAlert(message: msg)
                }
            })
        }
    }
    
}
