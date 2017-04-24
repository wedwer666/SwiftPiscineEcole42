//
//  FirstViewController.swift
//  Day05
//
//  Created by Mitriuc Maria on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit
import MapKit


class FirstViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl)
    {
        switch (sender.selectedSegmentIndex)
        {
            case 0:
                mapView.mapType = .standard
            case 1:
                mapView.mapType = .satellite
            default:
                mapView.mapType = .hybrid
                    }
    }
    
   
//    @IBAction func segmentedControlAction(sender: UISegmentedControl!) {
//        switch (sender.selectedSegmentIndex) {
//        case 0:
//            mapView.mapType = .Standard
//        case 1:
//            mapView.mapType = .Satellite
//        default:
//            mapView.mapType = .Hybrid
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        // set initial location in Honolulu
//        _ = CLLocation(latitude: 21.282778, longitude: -157.829444)
//        let regionRadius: CLLocationDistance = 1000
//        func centerMapOnLocation(location: CLLocation) {
//            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
//                                                                      regionRadius * 2.0, regionRadius * 2.0)
        
        let distanceSpan: CLLocationDegrees = 2000
        let bsuCSCampusLocation :  CLLocationCoordinate2D = CLLocationCoordinate2DMake( 47.039866, 28.824665)
            mapView.setRegion(MKCoordinateRegionMakeWithDistance( bsuCSCampusLocation, distanceSpan, distanceSpan ),            animated: true)
        
        let bsuCSClassPin = BSUAnnotation(title: "Academy + Moldova", subtitle: "I am here!!!", coordinate: bsuCSCampusLocation)
        mapView.addAnnotation(bsuCSClassPin)
        
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    


}
