//
//  PullRequestTableViewCell.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import Kingfisher

class PullRequestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblBody: UILabel!
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblFullname: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblTitle.text = ""
        self.lblBody.text = ""
        self.lblUsername.text = ""
        self.lblFullname.text = ""
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Cell Protocol

extension PullRequestTableViewCell: CellProtocol {
    
    func configureCell(object: AnyObject?) {
        if let pr = object as? PullRequestEntity {
            self.lblTitle.text = pr.title
            self.lblBody.text = pr.body
            self.lblUsername.text = pr.user?.login
            if let avatar = pr.user?.avatar {
                self.imgUser.kf.setImage(with: avatar)
            }
        }
    }
    
}
