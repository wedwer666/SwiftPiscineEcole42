//
//  FirstViewController.swift
//  Day05
//
//  Created by Mitriuc Maria on 4/24/17.
//  Copyright © 2017 Maria Mitriuc. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class FirstViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!

    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
     let manager = CLLocationManager()
    
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
    
   
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        let location = locations[0]
        
        let span: MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let myLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        mapView.setRegion(region, animated: true)
        //(location.coordinate.latitude, location.coordinate.longitude)
        
        
        print(location.altitude)
        print(location.speed)
        self.mapView.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let distanceSpan: CLLocationDegrees = 2000
        let bsuCSCampusLocation :  CLLocationCoordinate2D = CLLocationCoordinate2DMake( 47.039866, 28.824665)
            mapView.setRegion(MKCoordinateRegionMakeWithDistance( bsuCSCampusLocation, distanceSpan, distanceSpan ),            animated: true)
        
        let bsuCSClassPin = BSUAnnotation(title: "Academy + Moldova", subtitle: "I am here!!!", coordinate: bsuCSCampusLocation)
        mapView.addAnnotation(bsuCSClassPin)
        
        
        }
        // Do any additional setup after loading the view, typically from a nib.
    


}
