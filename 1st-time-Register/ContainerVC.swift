//
//  ContainerVC.swift
//  1st-time-Register
//
//  Created by Apple on 12/27/17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import UIKit

class ContainerVC: UIViewController {
    
    @IBOutlet weak var hiddenButton: UIButton!
    @IBOutlet weak var slideMenuLeading: NSLayoutConstraint!
    @IBOutlet weak var slideMenuView: UIView!
    var slideMenuIsVisible = false {
        didSet {
            UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
                if self.slideMenuIsVisible {
                    self.slideMenuLeading.constant = 0
                    self.hiddenButton.alpha = 1
                } else {
                    self.hiddenButton.alpha = 0
                    self.slideMenuLeading.constant = -self.slideMenuView.frame.width
                }
                self.view.layoutIfNeeded()
            }) { (animationComplete) in
                
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slideMenuLeading.constant = -slideMenuView.frame.width
        hiddenButton.alpha = 0
        NotificationCenter.default.addObserver(self, selector: #selector(tapToHideSlideMenu(_:)), name: Notification.Name.toggleMenu, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapToHideSlideMenu(_ sender: Any) {
        slideMenuIsVisible = !slideMenuIsVisible
        
        
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
