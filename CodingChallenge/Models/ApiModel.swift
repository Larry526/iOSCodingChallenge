//
//  ApiModel.swift
//  CodingChallenge
//
//

import Foundation
import ObjectMapper

class ApiModel : Mappable {
	var stories : [Story] = []
	var nextUrl : String = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {

		stories <- map["stories"]
		nextUrl <- map["nextUrl"]
	}

}
