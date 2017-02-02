//
//  RepositoryEntity.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Mapper

struct RepositoryEntity: Mappable {
    
    let repositoryID: Float?
    let name: String?
    let fullName: String?
    let owner: OwnerEntity?
    let isPrivate: Bool?
    let url: URL?
    let description: String?
    let stars: Float?
    let watchers: Float?
    let forks: Float?
    let openIssues: Int?
    
    init(map: Mapper) throws {
        self.repositoryID   = map.optionalFrom("id")
        self.name           = map.optionalFrom("name")
        self.fullName       = map.optionalFrom("full_name")
        self.owner          = map.optionalFrom("owner")
        self.isPrivate      = map.optionalFrom("private")
        self.url            = map.optionalFrom("html_url")
        self.description    = map.optionalFrom("description")
        self.stars          = map.optionalFrom("stargazers_count")
        self.watchers       = map.optionalFrom("watchers_count")
        self.forks          = map.optionalFrom("forks_count")
        self.openIssues     = map.optionalFrom("open_issues")
    }
    
}
