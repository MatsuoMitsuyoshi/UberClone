//
//  HomeController.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/03.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    private let inputActivationView = LocationInputActivationView()

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
        enableLocationServices()
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
            configureUI()
        }
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    // MARK: - Helper Functions
    
    func configureUI(){
        configureMapView()
        
        view.addSubview(inputActivationView)
        inputActivationView.centerX(inView: view)
        inputActivationView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
    }
    
    func configureMapView(){
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}

// MARK: - LocationServices

extension HomeController: CLLocationManagerDelegate {
    func enableLocationServices(){
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            print("DEBUG: Not determined..")
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedAlways:
            print("DEBUG: Auth always..")
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use..")
            locationManager.requestAlwaysAuthorization()
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}
