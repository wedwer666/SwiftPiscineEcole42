//
//  BSUAnnotation.swift
//  Day05
//
//  Created by Mitriuc Maria on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import MapKit

class  BSUAnnotation: NSObject, MKAnnotation
{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    //var mapPinDescription : String{
      //  return "\(titile): \(subtitile)"
    
    init (title: String, subtitle: String, coordinate:CLLocationCoordinate2D)
    {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }

}
