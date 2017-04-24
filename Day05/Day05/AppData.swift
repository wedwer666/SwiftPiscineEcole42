//
//  AppData.swift
//  Day05
//
//  Created by Cervac1 on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import Foundation

class AppData {
    public static var locations : [BSUAnnotation] = [
        BSUAnnotation(title: "Academy + Moldova", subtitle: "I am here", lat: 47.039866, long: 28.824665, distSpan: 2000),
        BSUAnnotation(title: "anywhere", subtitle: "I don`t know", lat: 23.031231, long: 53.1231231, distSpan: 2000)
    ]
    public static var curLocation : BSUAnnotation = AppData.locations[0]
    
}
