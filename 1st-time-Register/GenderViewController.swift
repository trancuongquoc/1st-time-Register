//
//  ViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 18.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class GenderViewController: UIViewController {

    
    @IBOutlet weak var maleCheckbox: UIButton!
    
    @IBOutlet weak var femaleCheckbox: UIButton!
    
    @IBOutlet weak var anotherCheckbox: UIButton!
    
    @IBOutlet weak var nextButton: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureCheckBoxes()
       self.isButtonSelected(isSelected: true, with: self.maleCheckbox)
    }
    
    // Set up check boxes.
    func configureCheckBoxes() {
        self.maleCheckbox.tag = 1
        self.femaleCheckbox.tag = 2
        self.anotherCheckbox.tag = 3
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         UserDefaults.standard.string(forKey: "gender")
    }
    @IBAction func checkBoxTapped(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 1:
            self.isButtonSelected(isSelected: true, with: self.maleCheckbox)
        case 2:
            self.isButtonSelected(isSelected: true, with: self.femaleCheckbox)
        case 3:
            self.isButtonSelected(isSelected: true, with: self.anotherCheckbox)
        default:
            self.isButtonSelected(isSelected: true, with: self.maleCheckbox)
        }
    }

    
    func isButtonSelected(isSelected: Bool,with sender: UIButton) {
        self.maleCheckbox.isSelected = false
        self.femaleCheckbox.isSelected = false
        self.anotherCheckbox.isSelected = false
        sender.isSelected = isSelected
        sender.setImage(UIImage(named: "icon_radioSelected"), for: .normal)
        UserDefaults.standard.set(sender.titleLabel?.text, forKey: "gender")
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
