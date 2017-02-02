//
//  RepositoryTableViewCell.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import UIKit
import Kingfisher

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblRepositoryName: UILabel!
    @IBOutlet weak var lblRepositoryDesc: UILabel!
    @IBOutlet weak var imgFork: UIImageView!
    @IBOutlet weak var lblForkCount: UILabel!
    @IBOutlet weak var imgStar: UIImageView!
    @IBOutlet weak var lblStarCount: UILabel!
    @IBOutlet weak var imgRepository: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblFullname: UILabel!
    
    // MARK: - Cell Methods

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblRepositoryName.text = ""
        self.lblRepositoryDesc.text = ""
        self.lblForkCount.text = ""
        self.lblStarCount.text = ""
        self.lblUsername.text = ""
        self.lblFullname.text = ""
        self.imgFork.tintColor = UIColor(colorLiteralRed: 219/255, green: 143/255, blue: 37/255, alpha: 1.0)
        self.imgStar.tintColor = UIColor(colorLiteralRed: 219/255, green: 143/255, blue: 37/255, alpha: 1.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Cell Protocol

extension RepositoryTableViewCell: CellProtocol {
    
    func configureCell(object: AnyObject?) {
        if let repository = object as? RepositoryEntity {
            if let avatar = repository.owner?.avatar {
                self.imgRepository.kf.setImage(with: avatar)
            }
            self.lblRepositoryName.text = repository.name
            self.lblRepositoryDesc.text = repository.description
            if let forks = repository.forks {
                self.lblForkCount.text = String(format: "%1.0f", forks)
            } else {
                self.lblForkCount.text = "0"
            }
            if let stars = repository.stars {
                self.lblStarCount.text = String(format: "%1.0f", stars)
            } else {
                self.lblStarCount.text = "0"
            }
            self.lblUsername.text = repository.owner?.login
        }
    }
    
}
