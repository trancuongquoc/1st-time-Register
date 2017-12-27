//
//  SummaryViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 18.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit
import CoreData
class SummaryViewController: UIViewController {
    @IBOutlet weak var cityLabelField: UILabel!

    @IBOutlet weak var districtLabelField: UILabel!
    
    @IBOutlet weak var genderLabelField: UILabel!
    
    @IBOutlet weak var ageLabelField: UILabel!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        showUpData()
    }
    func showUpData() {
        let selectedCityName = UserDefaults.standard.string(forKey: "cityName")!
        cityLabelField.text = selectedCityName
        
        let selectedDistrictName = UserDefaults.standard.string(forKey: "districtName")
        districtLabelField.text = selectedDistrictName
        
        var selectedGender = UserDefaults.standard.string(forKey: "gender")
        if let unselectedGenderIconIndex = selectedGender?.characters.index(of: "⚪️") {
            selectedGender?.remove(at: unselectedGenderIconIndex)
        }
        if let selectedGenderIconIndex = selectedGender?.characters.index(of: "🔘") {
            selectedGender?.remove(at: selectedGenderIconIndex)
        }
        genderLabelField.text = selectedGender
        
        let selectedAge = UserDefaults.standard.integer(forKey: "ageKey")
        ageLabelField.text = "\(selectedAge)"
        
    }
    
    func save(city: String, district: String, gender: String, age: Int16) {
        let managedContext = AppDelegate.shared?.persistentContainer.viewContext
        let person = Person(context: managedContext!)
        person.age = Int16(age)
        person.city = city
        person.district = district
        person.gender = gender
       AppDelegate.shared?.saveContext()

    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let age = Int16(ageLabelField.text!)
        save(city: cityLabelField.text!, district: districtLabelField.text!, gender: genderLabelField.text!, age: age!)
    }
}
