//
//  User.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/04.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//
import CoreLocation

enum AccountType: Int {
    case passenger
    case driver
}

struct User {
    let fullname: String
    let email: String
    var accountType: AccountType!
    var location: CLLocation?
    let uid: String
    
    var homeLocation: String?
    var workLocation: String?
    
    var firstInitial: String { return String(fullname.prefix(1)) }

    init(uid: String, dictionary: [String: Any]) {
        self.uid = uid
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        
        if let home = dictionary["homeLocation"] as? String {
            self.homeLocation = home
        }
        
        if let work = dictionary["workLocation"] as? String {
            self.workLocation = work
        }

        if let index = dictionary["accountType"] as? Int {
            self.accountType = AccountType(rawValue: index)
        }
    }
}
