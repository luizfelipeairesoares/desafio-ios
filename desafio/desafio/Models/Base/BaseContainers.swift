//
//  BaseContainers.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Mapper

struct BaseListContainer<T: Mappable>: Mappable {
    
    let totalCount: Float?
    let incompleteResults: Bool?
    let items: [T]?
    
    init(map: Mapper) throws {
        self.totalCount         = map.optionalFrom("total_count")
        self.incompleteResults  = map.optionalFrom("incomplete_results")
        self.items              = map.optionalFrom("items")
    }
    
}
