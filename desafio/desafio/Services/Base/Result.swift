//
//  Result.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation

enum Result<T, String> {
    case success(T)
    case failure(String)
}
