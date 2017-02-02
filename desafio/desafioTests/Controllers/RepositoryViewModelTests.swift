//
//  RepositoryViewModelTests.swift
//  desafio
//
//  Created by Luiz Aires Soares on 02/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Quick
import Nimble
@testable
import desafio


class RepositoryViewModelTests: QuickSpec {
        
    override func spec() {
        
        var viewmodel: RepositoryViewModel!
        
        beforeEach {
            viewmodel = RepositoryViewModel()
        }
        
        describe("Test call to repositories service") {
            
            beforeEach {
                viewmodel.requestRepositories()
            }
            
            it("") {
                XCTAssert(viewmodel.currentPage == 1)
            }
        }
        
        describe("Test call to pull requests service") {
            
            
        
        }
    }
    
}
