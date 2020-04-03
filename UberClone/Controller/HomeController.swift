//
//  HomeController.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/03.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

import UIKit
import Firebase

class HomeController: UIViewController {
    
    // MARK: - Properties

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
//        signOut()
        view.backgroundColor = .red
    }
    
    // MARK: - API
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser?.uid == nil {
            print("DEBUG: User not logged in..")
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            print("DEBUG: User id is \(Auth.auth().currentUser?.uid)")
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    // MARK: -
    // MARK: -
    // MARK: -
    // MARK: -
    // MARK: -
}
