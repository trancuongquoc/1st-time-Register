//
//  District.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 16.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import Foundation

class District {
    var districtName: String
    var districtCode: Int
    var cityCode: Int

    init?(dict: Dictionary<AnyHashable, Any>) {
        guard let districtName = dict["Name"] as? String else { return nil }
        guard let districtCode = dict["DistrictCode"] as? Int else { return nil }
        guard let cityCode = dict["CityCode"] as? Int else { return nil}

        self.districtName = districtName
        self.districtCode = districtCode
        self.cityCode = cityCode

    }
}
