//
//  StoriesApiProtocol.swift
//  CodingChallenge
//
//

import Foundation

// Protocols for api
protocol StoriesApiProtocol {
    func fetchStories(url: String)
}

// API delegates to domain
protocol StoriesApiListener: class {
    func onDataFetch(api: ApiModel)
    func onLocalDataFetch()
}
