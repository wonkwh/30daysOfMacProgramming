//
//  Preferences.swift
//  EggTimer
//
//  Created by wonkwh on 28/11/2018.
//  Copyright © 2018 wonkwh. All rights reserved.
//

import Foundation

struct Preferences {
    var selectedTime: TimeInterval {
        get {
            let savedTime = UserDefaults.standard.double(forKey: "selectedTime")
            if savedTime > 0 {
                return savedTime
            }
            return 360
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "selectedTime")
        }
    }
    
}
