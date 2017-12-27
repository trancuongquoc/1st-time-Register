//
//  StartViewController.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 20.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var blueViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var userListView: UIView!
    
    @IBOutlet weak var blueViewTrailing: NSLayoutConstraint!
    
    var hamburgerMenuIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hamburgerBtnTapped(_ sender: UIBarButtonItem) {
        if !hamburgerMenuIsVisible {
            blueViewLeading.constant = userListView.frame.width
           //blueViewTrailing.constant = 298
            hamburgerMenuIsVisible = true
        } else {
            blueViewLeading.constant = 0
            blueViewTrailing.constant = 0
            hamburgerMenuIsVisible = false
        }
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("complete")
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


