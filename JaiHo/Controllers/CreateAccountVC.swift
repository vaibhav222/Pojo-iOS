//
//  CreatePriestAccountVC.swift
//  JaiHo
//
//  Created by Barchhiha, Vaibhav on 17/02/20.
//  Copyright © 2020 Barchhiha, Vaibhav. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

protocol UserTypeSelector: AnyObject {
    var isUser: Bool { get set }
}

class CreateAccountVC: UIViewController {

    @IBOutlet weak var mainContainerView: UIView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var passwordFieldContainerView: UIView!
    
    weak var userTypeDelegate: UserTypeSelector!
    
    var locationManager: CLLocationManager!
    var isSecureTextEntry = true
    private var isUser: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        mainContainerView.makeRoundedView(width: 2.0)
        if userTypeDelegate.isUser == false {
            passwordFieldContainerView.isHidden = true
        }
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
    }
    
    @IBAction func showPasswordButtonTapped(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !isSecureTextEntry
        isSecureTextEntry = !isSecureTextEntry
    }
    
    @IBAction func selectLoationButtonTapped(_ sender: Any) {
        
    }
}

extension CreateAccountVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue = manager.location else { return }
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(locValue) { (placemarks, error) in
            if let newPlacemarks = placemarks, error == nil && newPlacemarks.count > 0 {
                if let placeMark = newPlacemarks.last {
                    self.addressTextField.text = "\(placeMark.thoroughfare ?? "")\n\(placeMark.postalCode ?? "") \(placeMark.locality ?? "")\n\(placeMark.country ?? "")"
                    self.locationManager.stopUpdatingLocation()
                }
            }
        }
    }
    
    
}
