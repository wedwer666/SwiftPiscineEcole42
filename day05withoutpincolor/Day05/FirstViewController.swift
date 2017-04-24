import UIKit
import MapKit
import CoreLocation



class FirstViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func conectPosition(_ sender: UIButton)
    {
        manager.startUpdatingLocation()
    }
    
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
        
        print(location.altitude)
        print(location.speed)
        self.mapView.showsUserLocation = true
        manager.stopUpdatingLocation()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(AppData.curLocation.coordinate, AppData.curLocation.distSpan, AppData.curLocation.distSpan), animated: true)
        AppData.locations.forEach { (annotation) in
            mapView.addAnnotation(annotation)
        }
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}
