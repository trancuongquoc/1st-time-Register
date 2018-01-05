//
//  EditUserViewController.swift
//  1st-time-Register
//
//  Created by Apple on 12/28/17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class EditUserViewController: UIViewController, UITextFieldDelegate {
    var user : Person?
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    @IBOutlet weak var anotherWorldButton: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cityTextField.delegate = self
        districtTextField.delegate = self
        setTagGenderCheckBox()
    
        if let user = user {
            cityTextField.text = user.city
            districtTextField.text = user.district
            
            }
        }
        // Do any additional setup after loading the view.
    


    override func didReceiveMemoryWarning(  ) {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setTagGenderCheckBox() {
        self.maleButton.tag = 1
        self.femaleButton.tag = 2
        self.anotherWorldButton.tag = 3
    }
    @IBAction func genderBttnTapped(_ sender: UIButton) {
        switch (sender as AnyObject).tag {
        case 1:
            self.isButtonSelected(isSelected: true, with: self.maleButton)
        case 2:
            self.isButtonSelected(isSelected: true, with: self.femaleButton)
        case 3:
            self.isButtonSelected(isSelected: true, with: self.anotherWorldButton)
        default:
            self.isButtonSelected(isSelected: true, with: self.maleButton)
        }
    }
    
    func isButtonSelected(isSelected: Bool,with sender: UIButton) {
        self.maleButton.isSelected = false
        self.femaleButton.isSelected = false
        self.anotherWorldButton.isSelected = false
        sender.isSelected = isSelected
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
