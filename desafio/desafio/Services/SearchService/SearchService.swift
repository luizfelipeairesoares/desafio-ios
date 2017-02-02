//
//  SearchService.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper

struct SearchService {
    
    private let provider: MoyaProvider<GithubAPI> = MoyaProvider<GithubAPI>(endpointClosure: { (target: GithubAPI) -> Endpoint<GithubAPI> in
        let url = target.baseURL.appendingPathComponent(target.path).absoluteString
        let endpoint: Endpoint<GithubAPI> = Endpoint<GithubAPI>(url: url,
                                                                sampleResponseClosure: { .networkResponse(200, target.sampleData) },
                                                                    method: target.method,
                                                                    parameters: target.parameters,
                                                                    parameterEncoding: target.parameterEncoding,
                                                                    httpHeaderFields: ["Accept" : "application/vnd.github.v3+json"])
        return endpoint
    }, plugins: [NetworkLoggerPlugin(verbose: true)])
    
    
    // MARK: - Requests
    
    internal func searchRepositories(language: String = "language:Java",
                                     sort: String = "stars",
                                     page: Int = 1,
                                     completion: @escaping (Result<BaseListContainer<RepositoryEntity>, String>) -> Void) {
        self.provider.request(.searchRepositories(language: language, sort: sort, page: page)) { result in
            switch result {
            case .success(let container):
                do {
                    let list: BaseListContainer<RepositoryEntity> = try container.mapObject() as BaseListContainer<RepositoryEntity>
                    completion(Result.success(list))
                } catch {
                    completion(Result.failure(MoyaError.statusCode(container).localizedDescription))
                }
            case .failure(let error):
                completion(Result.failure(error.localizedDescription))
            }
        }
    }
    
    internal func requestPulls(repository: String, completion: @escaping (Result<[PullRequestEntity], String>) -> Void) {
        self.provider.request(.pullRequests(repository: repository)) { result in
            switch result {
            case .success(let response) :
                do {
                    let list: [PullRequestEntity] = try response.mapArray() as [PullRequestEntity]
                    completion(Result.success(list))
                } catch {
                    completion(Result.failure(MoyaError.statusCode(response).localizedDescription))
                }
            case .failure(let error):
                completion(Result.failure(error.localizedDescription))
            }
        }
    }
    
}
