//
//  AgePickerViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 18.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class AgePickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var ageValues = [Int](1...100)

    @IBOutlet weak var agePickerView: UIPickerView!
    
    @IBOutlet weak var agePickedTextField: UITextField!
    
    @IBOutlet weak var nextButton: RadioButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        agePickedTextField.inputView = agePickerView
        agePickedTextField.text = "\(ageValues[17])"
        agePickerView.selectRow(17, inComponent: 0, animated: true)
    }
    

   
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ageValues.count
    }
    
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(ageValues[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        agePickedTextField.text = "\(ageValues[row])"
        self.view.endEditing(true)
        UserDefaults.standard.set(ageValues[row], forKey: "ageKey")
    }

    
//
//    open func rowSize(forComponent component: Int) -> CGSize
//
//
//    // returns the view provided by the delegate via pickerView:viewForRow:forComponent:reusingView:
//    // or nil if the row/component is not visible or the delegate does not implement
//    // pickerView:viewForRow:forComponent:reusingView:
//    open func view(forRow row: Int, forComponent component: Int) -> UIView?
//
//
//    // Reloading whole view or single component
//    open func reloadAllComponents()
//
//    open func reloadComponent(_ component: Int)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
