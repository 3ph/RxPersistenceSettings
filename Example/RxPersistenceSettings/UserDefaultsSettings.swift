//
//  UserDefaultsSettings.swift
//  RxPersistenceSettings_Example
//
//  Created by Tomas Friml on 5/04/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RxPersistenceSettings

/*
class NumericUserDefaultsSetting: UserDefaultsSetting {
    typealias T = Int

    var titleString: String {
        return "Numeric User Defaults 1"
    }
    
    var infoString: String {
        return "Info about this numeric setting store in UserDefaults. Range from -10 to 10." }
    
    var isNumeric: Bool {
        return true
    }

    var isAtMin: Bool {
        return value == -10
    }
    
    var isAtMax: Bool {
        return value == 10
    }
    
    func increase() {
        if isAtMax == false {
            value += 1
        }
    }
    
    func decrease() {
        if isAtMin == false {
            value -= 1
        }
    }
    
    var key: String {
        return "RxPersistenceSettings_Numeric1"
    }
    
    var defaultValue: Int {
        return 0
    }
    
    func format(value: Int) -> String {
        return value > 0 ? "+" : String() + "\(value)"
    }
}
*/
