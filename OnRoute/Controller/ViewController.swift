//
//  ViewController.swift
//  OnRoute
//
//  Created by Thong Tran on 3/11/18.
//  Copyright © 2018 Thong Tran. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController ,CLLocationManagerDelegate{
    @IBAction func searchBtn(_ sender: Any) {
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "NewsInventoryCollectionViewController") as! NewsInventoryCollectionViewController
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var menuBtn: UIBarButtonItem!
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        menuBtn.target = revealViewController()
        menuBtn.action = #selector(SWRevealViewController.revealToggle(_:))
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        
        let center = location.coordinate
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        
    }
    

  

}

