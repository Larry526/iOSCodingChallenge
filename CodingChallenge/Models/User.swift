//
//  User.swift
//  CodingChallenge
//
//

import Foundation
import ObjectMapper

class User : Mappable {
	var name : String = ""
    // MARK: avatar image was not used since it was not mentioned in the problem statment as a requirement.
	var avatar : String = ""
	var fullname : String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
		name <- map["name"]
		avatar <- map["avatar"]
		fullname <- map["fullname"]
	}

}
