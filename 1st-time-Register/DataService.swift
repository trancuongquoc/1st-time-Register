//
//  dataService.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 16.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import Foundation

class DataServices {
    static let shared = DataServices()
    
    private var _cities: [City]?
    
    var cities: [City] {
        get {
            if _cities == nil {
                updateCities()
            }
            return _cities ?? []
        }
        set {
            _cities = newValue
        }
    }
    
    fileprivate func updateCities() {
        _cities = []
        if let plistCities = PlistServices().getDictionaryFrom(plist: "Cities.plist") {
            let cities = plistCities["Cities"] as? [Dictionary<AnyHashable,Any>]
            for item in cities! {
                _cities?.append(City(dict: item)!)
            }
        }
    }
    
    private var _districts: [District]?

    var districts: [District] {
        get {
            if _districts == nil {
                updateDistricts()
            }
            return _districts ?? []
        }
        set {
            _districts = newValue
        }
    }
    
    fileprivate func updateDistricts() {
        _districts = []
        if let plistDistricts = PlistServices().getDictionaryFrom(plist: "Districts.plist") {
            let districts = plistDistricts["Districts"] as? [Dictionary<AnyHashable,Any>]
            for item in districts! {
                _districts?.append(District(dict: item)!)
                
               
            }
        }
    }

}


class PlistServices {

    func getDictionaryFrom(plist: String) -> Dictionary<AnyHashable, Any>? {
        
        var result : Dictionary<AnyHashable, Any>?
        let fileNameComponents = plist.components(separatedBy: ".")
        guard let filePath = Bundle.main.path(forResource: fileNameComponents.first ?? "", ofType: fileNameComponents.last ?? "") else {
            return nil
        }
        
        guard FileManager.default.fileExists(atPath: filePath) == true else {
            return nil
        }
        
        guard let data = FileManager.default.contents(atPath: filePath) else {
            return nil
        }
        do {
            guard let root = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? Dictionary<AnyHashable, Any> else {
                return nil
            }
            result = root
            
        } catch {
            print("Error: PropertyListSerialization error")
        }
        return result
    }
    
}
