//
//  ViewController.swift
//  GMap_Swift_test
//
//  Created by Xi Yang on 9/19/15.
//  Copyright © 2015 Xi Yang. All rights reserved.
//

import UIKit
import GoogleMaps



class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: GMSMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
    

//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2DMake(-33.86, 151.20)
//        marker.title = "Sydney"
//        marker.snippet = "Australia"
//        marker.map = mapView
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(manager: CLLocationManager, didChangeAuthorizationStatus status: CLAuthorizationStatus) {
        if status == .AuthorizedWhenInUse {
            
            locationManager.startUpdatingLocation()
            
            mapView.myLocationEnabled = true
            mapView.settings.myLocationButton = true


        }
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations.last;
        
        mapView.camera = GMSCameraPosition(target: location!.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        
        var coord = CLLocationCoordinate2D();
        coord.longitude = location!.coordinate.longitude;
        coord.latitude = location!.coordinate.latitude;

        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(coord.latitude,coord.longitude)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
        
        locationManager.stopUpdatingLocation()
        
    }
}