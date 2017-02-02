//
//  PullRequestViewController.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit

class PullRequestViewController: UIViewController {
    
    @IBOutlet weak var lblOpenClose: UILabel!
    @IBOutlet weak var lblEmpty: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    weak var viewModel: RepositoryViewModel?
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.lblOpenClose.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.isHidden = true
        self.title = self.viewModel?.currentRepository?.name
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel?.requestPulls()
        if let open = self.viewModel?.currentRepository?.openIssues {
            self.lblOpenClose.text = "\(open) open issues"
            self.lblOpenClose.isHidden = false
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.viewModel?.currentRepository = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func assignViewModel(viewModel: RepositoryViewModel?) {
        self.viewModel = viewModel
        self.viewModel?.assignController(controller: self)
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

// MARK: - Repository Protocol

extension PullRequestViewController: RepositoryProtocol {
    
    func reloadTable() {
        if self.viewModel?.prs.count == 0 {
            self.tableView.reloadData()
            self.tableView.isHidden = false
        } else {
            self.lblEmpty.isHidden = false
        }
    }
    
}

// MARK: - TableViewDatasource

extension PullRequestViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.prs.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PullRequestTableViewCell.cellIdentifier(), for: indexPath) as! PullRequestTableViewCell
        cell.configureCell(object: self.viewModel?.prs[indexPath.row] as AnyObject?)
        return cell
    }
    
}

// MARK: - TableViewDelegate

extension PullRequestViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
