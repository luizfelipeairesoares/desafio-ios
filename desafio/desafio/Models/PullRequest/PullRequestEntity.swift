//
//  PullRequestEntity.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Mapper

struct PullRequestEntity: Mappable {
    
    let url: URL?
    let prID: Float?
    let diff: URL?
    let patch: URL?
    let issue: URL?
    let number: Float?
    let state: String?
    let locked: Bool?
    let title: String?
    let user: UserEntity?
    let body: String?
    let createdAt: String?
    let updatedAt: String?
    let closedAt: String?
    let mergedAt: String?
    
    init(map: Mapper) throws {
        self.url        = map.optionalFrom("html_url")
        self.prID       = map.optionalFrom("id")
        self.diff       = map.optionalFrom("diff_url")
        self.patch      = map.optionalFrom("patch_url")
        self.issue      = map.optionalFrom("issue_url")
        self.number     = map.optionalFrom("number")
        self.state      = map.optionalFrom("state")
        self.locked     = map.optionalFrom("locked")
        self.title      = map.optionalFrom("title")
        self.user       = map.optionalFrom("user")
        self.body       = map.optionalFrom("body")
        self.createdAt  = map.optionalFrom("created_at")
        self.updatedAt  = map.optionalFrom("updated_at")
        self.closedAt   = map.optionalFrom("closed_at")
        self.mergedAt   = map.optionalFrom("merged_at")
    }
}
