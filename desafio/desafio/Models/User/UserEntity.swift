//
//  UserEntity.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Mapper

struct UserEntity: Mappable {
    
    let login: String?
    let userID: Float?
    let avatar: URL?
    let url: URL?
    
    init(map: Mapper) throws {
        self.login      = map.optionalFrom("login")
        self.userID     = map.optionalFrom("id")
        self.avatar     = map.optionalFrom("avatar_url")
        self.url        = map.optionalFrom("html_url")
    }
    
}
