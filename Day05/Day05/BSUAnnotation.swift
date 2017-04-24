//
//  BSUAnnotation.swift
//  Day05
//
//  Created by Mitriuc Maria on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import MapKit

class BSUAnnotation: NSObject, MKAnnotation {
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    var distSpan : CLLocationDegrees
    
    init(title: String, subtitle: String, lat: Double, long: Double, distSpan: CLLocationDegrees) {
        self.title = title
        self.subtitle = subtitle
        self.distSpan = distSpan
        self.coordinate = CLLocationCoordinate2DMake(lat, long)
    }
}
