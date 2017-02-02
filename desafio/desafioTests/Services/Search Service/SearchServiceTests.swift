//
//  SearchServiceTests.swift
//  desafio
//
//  Created by Luiz Aires Soares on 02/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Quick
import Nimble
@testable
import desafio
import Moya

class SearchServiceTests: QuickSpec {
    
    override func spec() {
        
        let fakeEndpointClosure = { (target: GithubAPI) -> Endpoint<GithubAPI> in
            let url = target.baseURL.appendingPathComponent(target.path).absoluteString
            let endpoint: Endpoint<GithubAPI> = Endpoint<GithubAPI>(url: url,
                                                                    sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                                                                    method: target.method,
                                                                    parameters: target.parameters,
                                                                    parameterEncoding: target.parameterEncoding,
                                                                    httpHeaderFields: ["Accept" : "application/vnd.github.v3+json"])
            return endpoint
        }
    
        var fakeProvider: MoyaProvider<GithubAPI>!
        
        beforeEach {
            fakeProvider = MoyaProvider<GithubAPI>(endpointClosure: fakeEndpointClosure, stubClosure: MoyaProvider<GithubAPI>.immediatelyStub)
        }
        
        context("Testing search repositories") {
            var called = false
            beforeEach {
                fakeProvider.request(.searchRepositories(language: "language:Java", sort: "stars", page: 1), completion: { _ in
                    called = true
                })
            }
            it("") {
                expect(called).to(beTrue())
            }
        }
        
        context("Testing pull requests") {
            var called = false
            beforeEach {
                fakeProvider.request(.pullRequests(repository: ""), completion: { _ in
                    called = true
                })
            }
            it("") {
                expect(called).to(beTrue())
            }
        }
    }
}
