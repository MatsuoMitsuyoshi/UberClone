//
//  Service.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/04.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

import Firebase

// MARK: - DatabaseRefs

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

struct Service {
    
    static let shared = Service()
    let currentUid = Auth.auth().currentUser?.uid
    
    func fetchUserData(completion: @escaping(User) -> Void) {
        REF_USERS.child(currentUid!).observeSingleEvent(of: .value) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else { return }
            guard let fullname = dictionary["fullname"] as? String else { return }
            let user = User(dictionary: dictionary)
            
            print("DEBUG: User email is \(user.email)")
            print("DEBUG: User fullname is \(user.fullname)")
            
            completion(user)
        }
    }
}
