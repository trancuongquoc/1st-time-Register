//
//  File.swift
//  1st-time-Register
//
//  Created by Quốc Đạt on 18.12.17.
//  Copyright © 2017 LastManStanding. All rights reserved.
//

import Foundation
class ASDAS {
    var countdown = Time(seconds: 42.0)
    
    func show() {
        print(countdown.minutes)              //Reading value (Results in 0.7 minutes)
        
        countdown.hours = 1            //Setting value (Internally stored as 3,600 seconds)
        
        print(countdown.minutes)              //Reading value (Results in 60.0 minutes)
        
        print(countdown.seconds)
    }
 
}
class Time {
    var seconds:Double = 0
    
    init(seconds: Double) {
        self.seconds = seconds
    }
    
    var minutes: Double {
        get {
            return (seconds / 60)
        }
        set {
            self.seconds = (newValue * 60)
        }
    }
    
    var hours: Double {
        get {
            return (seconds / (60 * 60))
        }
        set {
            self.seconds = (newValue * (60 * 60))
        }
    }
    
    var days:  Double {
        get {
            return (seconds / (60 * 60 * 24))
        }
        set {
            self.seconds = (newValue * (60 * 60 * 24))
        }
    }
}


