//
//  StoriesApi.swift
//  CodingChallenge
//
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class StoriesApi: StoriesApiProtocol {
    
    weak var apiListener: StoriesApiListener?
    
    init(listener: StoriesApiListener) {
        apiListener = listener
    }
    
    func fetchStories(url: String) {
        Alamofire.request(url, method: .get, parameters: [:], encoding: URLEncoding(), headers: nil).responseObject { (response: DataResponse<ApiModel>) in
            switch response.result {
            case .success(_):
                // MARK: Made the assumption that server will return valid json.
                if let resp = response.result.value {
                    self.apiListener?.onDataFetch(api: resp)
                }
            case .failure(let error):
                // API fails, ask domain to check DB for cache data.
                self.apiListener?.onLocalDataFetch()
                return
            }
        }
    }
}
