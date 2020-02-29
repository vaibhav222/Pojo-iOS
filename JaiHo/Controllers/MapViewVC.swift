//
//  MapViewVC.swift
//  JaiHo
//
//  Created by Barchhiha, Vaibhav on 23/02/20.
//  Copyright © 2020 Barchhiha, Vaibhav. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewVC: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapContainerView: UIView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let camera = GMSCameraPosition.camera(withLatitude: 23.931735,longitude: 121.082711, zoom: 7)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        self.mapContainerView = mapView
        mapView.isMyLocationEnabled = true

        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
    }
}
