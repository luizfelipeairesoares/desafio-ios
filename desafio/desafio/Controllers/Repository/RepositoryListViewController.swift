//
//  RepositoryListViewController.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

class RepositoryListViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    fileprivate var viewModel: RepositoryViewModel? = nil
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.viewModel = RepositoryViewModel()
        
        self.tblView.tableFooterView = UIView(frame: .zero)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Github"
        self.viewModel?.assignController(controller: self)
        self.viewModel?.requestRepositories()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.title = ""
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height - self.tblView.frame.size.height
        if actualPosition >= contentHeight {
            self.viewModel?.requestRepositories()
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - RepositoryProtocol

extension RepositoryListViewController: RepositoryProtocol {
    
    func reloadTable() {
        self.tblView.reloadData()
    }
    
}

// MARK: - UITableViewDatasource

extension RepositoryListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.repositories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.cellIdentifier(), for: indexPath) as! RepositoryTableViewCell
        if let repository = self.viewModel?.repositories[indexPath.row] {
            cell.configureCell(object: repository as AnyObject?)
        }
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension RepositoryListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.viewModel?.currentRepository = self.viewModel?.repositories[indexPath.row]
        
        let prController = self.storyboard?.instantiateViewController(withIdentifier: PullRequestViewController.storyboardID()) as! PullRequestViewController
        prController.assignViewModel(viewModel: self.viewModel)
        self.navigationController?.pushViewController(prController, animated: true)
    }
    
}
