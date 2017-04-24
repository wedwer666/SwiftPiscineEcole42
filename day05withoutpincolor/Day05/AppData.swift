//
//  AppData.swift
//  Day05
//
//  Created by Cervac1 on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import Foundation
import UIKit

class AppData {
    public static var locations : [BSUAnnotation] = [
        BSUAnnotation(title: "Academy + Moldova", subtitle: "I am here", lat: 47.039866, long: 28.824665, distSpan: 2000, pinColor: UIColor.green),
        BSUAnnotation(title: "Paradise", subtitle: "Yessss!!!", lat: 23.031231, long: 53.1231231, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Bucharest", subtitle: "Very beautiful city!", lat: 44.426767, long: 26.102538, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Kiev", subtitle: "Eurovision 2017", lat: 50.450100, long: 30.523400, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Moscow", subtitle: "I have been here!", lat: 55.755826, long: 37.617300, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Moscow", subtitle: "I have been here!", lat: 55.755826, long: 37.617300, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Perm", subtitle: "I adore this city!", lat: 58.029681, long: 56.266792, distSpan: 2000, pinColor: UIColor.yellow),
        BSUAnnotation(title: "Paris", subtitle: "I want to visit you!", lat: 48.856614, long: 2.352222, distSpan: 2000, pinColor: UIColor.yellow),
        
    ]
    public static var curLocation : BSUAnnotation = AppData.locations[0]
    
}
