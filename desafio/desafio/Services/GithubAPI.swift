//
//  GithubAPI.swift
//  desafio
//
//  Created by Luiz Aires Soares on 01/02/17.
//  Copyright © 2017 Arena. All rights reserved.
//

import Foundation
import Moya

public enum GithubAPI {
    
    case searchRepositories(language: String, sort: String, page: Int)
    case pullRequests(repository: String)
    
}

extension GithubAPI: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://api.github.com/") ?? URL(string: "")!
    }
    
    
    public var path: String {
        switch self {
        case .searchRepositories(_, _, _):
            return "search/repositories"
        case .pullRequests(let repository):
            return "repos/\(repository)/pulls"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var parameters: [String : Any]? {
        switch self {
        case .searchRepositories(let language, let sort, let page):
            return ["q" : language, "sort" : sort, "page" : page]
        default:
            return nil
        }
    }
    
    public var parameterEncoding: Moya.ParameterEncoding {
        return URLEncoding()
    }
    
    public var sampleData: Data {
        switch self {
        case .searchRepositories(_, _, _):
            return stubbedResponse("stub_search_repositories")
        default:
            return stubbedResponse("stub_pull_requests")
        }
    }
    
    public var task: Task {
        return .request
    }
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
