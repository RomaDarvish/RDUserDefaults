//
//  RDUserDefaults.swift
//  UserDefaultsDemo
//
//  Created by Roman Darvishov on 4/21/17.
//  Copyright © 2017 Roman Darvishov. All rights reserved.
//

import UIKit


class RDUserDefaults {
    
    private static let defaults = UserDefaults.standard
    
    // Setters
    
    static func setObject (key: String, value: Any) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: value)
        defaults.set(encodedData, forKey: key)
        defaults.synchronize()
    }
    
    static func setString (key: String, value: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func setInt (key: String, value: Int) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func setDouble (key: String, value: Double) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func setFloat (key: String, value: Float) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    static func setBool (key: String, value: Bool) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
   
    // Getters
    
    static func getObject (key: String) -> Any? {
        if defaults.object(forKey: key) != nil {
            let decoded  = defaults.object(forKey: key) as! Data
            let decodedTeams = NSKeyedUnarchiver.unarchiveObject(with: decoded)
            return decodedTeams as Any
        } else {
            return [:] as Any
        }
    }
    
    static func getString (key: String) -> String? {
        return defaults.object(forKey: key) as? String
    }
    
    static func getInt (key: String) -> Int {
        return defaults.integer(forKey: key)
    }
    
    static func getDouble (key: String) -> Double {
        return defaults.double(forKey: key)
    }
    
    static func getFloat (key: String) -> Float {
        return defaults.float(forKey: key)
    }
    
    static func getBool (key: String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    // Remover 
    
    static func remove (key: String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    
    }
}
