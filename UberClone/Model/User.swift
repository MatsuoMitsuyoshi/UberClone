//
//  User.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/04.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

struct User {
    let fullname: String
    let email: String
    let accountType: Int
    
    init(dictionary: [String: Any]) {
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.accountType = dictionary["accountType"] as? Int ?? 0
    }
}
