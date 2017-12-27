//
//  model.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 16.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import Foundation


class City {
    var name: String
    var cityCode: Int
    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let name = dict["Name"] as? String else { return nil }
        guard let cityCode = dict["CityCode"] as? Int else {return nil }
        self.name = name
        self.cityCode = cityCode
    }
}
