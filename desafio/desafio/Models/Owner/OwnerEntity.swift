//
//  OwnerEntity.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Mapper

struct OwnerEntity: Mappable {
    
    let login: String?
    let ownerID: Float?
    let avatar: URL?
    let url: URL?
    
    init(map: Mapper) throws {
        self.login      = map.optionalFrom("login")
        self.ownerID    = map.optionalFrom("id")
        self.avatar     = map.optionalFrom("avatar_url")
        self.url        = map.optionalFrom("html_url")
    }
    
}
