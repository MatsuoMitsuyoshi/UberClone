//
//  DriverAnnotation.swift
//  UberClone
//
//  Created by mitsuyoshi matsuo on 2020/04/05.
//  Copyright © 2020 mitsuyoshi matsuo. All rights reserved.
//

import MapKit

class DriverAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var uid: String
    
    init(uid: String, coordinate: CLLocationCoordinate2D) {
        self.uid = uid
        self.coordinate = coordinate
    }
}
