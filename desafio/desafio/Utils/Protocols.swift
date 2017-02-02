//
//  Protocols.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import UIKit
import PKHUD

// MARK: - Cell Protocol

protocol CellProtocol {
    
    static func cellIdentifier() -> String
    func configureCell(object: AnyObject?)
    
}

extension CellProtocol where Self: UITableViewCell {
    
    static func cellIdentifier() -> String {
        return "\(self)Identifier"
    }
    
    
}

// MARK: - Controllers Protocol

protocol ControllersProtocol {
    
    static func storyboardID() -> String
    func showLoading()
    func hideLoading()
    func showAlert(message: String)
    
}

extension ControllersProtocol where Self: UIViewController {
    
    static func storyboardID() -> String {
        return "\(self)StoryboardID"
    }
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.flash(.success, delay: 0.2)
    }
    
    func showAlert(message: String) {
        self.hideLoading()
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
