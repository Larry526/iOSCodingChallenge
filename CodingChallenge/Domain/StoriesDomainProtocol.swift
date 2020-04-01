//
//  StoriesDomainProtocol.swift
//  CodingChallenge
//
//

import Foundation

// Protocols for domain
protocol StoriesDomainProtocol {
    func fetchStories(requestType: RequestType)
}

// Domain delegates to presenter
protocol StoriesDomainListener: class {
    func onDataFetch(stories: [Story], isLocal: Bool)
    func onDataFetchError(errorString: String)
}
