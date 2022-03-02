//
//  MapViewController.swift
//  matDuk
//
//  Created by 소프트웨어컴퓨터 on 2022/01/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var lblInfo: UILabel!
    @IBOutlet weak var mapInfo: MKMapView!
    
    let list = SetSection.matList()
    var matIndex : IndexPath = []
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let lt = list[matIndex.section].items[matIndex.row].latitude
        let lg = list[matIndex.section].items[matIndex.row].longitude
        
        lblInfo.text = ""
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingHeading()
        mapInfo.showsUserLocation = true
        
        goLocation(latitude: lt, longitude: lg, delta: 0.001)
        setPin(latitudeValue: lt, longitudeValue: lg, delta: 0.001, title: "", subtitle: "")
        viewAddress(lt, lg)
    }
    
    func receiveIndex(_ index: IndexPath) {
        matIndex = index
    }
    
    func goLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees, delta span: Double) {
        let pLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let pSpanValue = MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span)
        let pRegion = MKCoordinateRegion(center: pLocation, span: pSpanValue)
        
        mapInfo.setRegion(pRegion, animated: true)
        
    }
    
    func setPin(latitudeValue: CLLocationDegrees, longitudeValue: CLLocationDegrees, delta span: Double, title strTitle: String, subtitle strSubTitle: String) {
        mapInfo.removeAnnotations(mapInfo.annotations)
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2DMake(latitudeValue, longitudeValue)
        pin.title = strTitle
        pin.subtitle = strSubTitle
        mapInfo.addAnnotation(pin)
    }
    
    func viewAddress(_ latitudeValue: CLLocationDegrees, _ longitudeValue: CLLocationDegrees) {
        let pLocation = CLLocation(latitude: latitudeValue, longitude: longitudeValue)
        let locale = Locale(identifier: "ko_KR")
        
        CLGeocoder().reverseGeocodeLocation(pLocation, preferredLocale: locale, completionHandler: {
            (Placemarks, error) in
            if let address: [CLPlacemark] = Placemarks {
                var addr: String = ""
                if let area: String = address.last?.locality {
                    addr += area
                }
                if let name: String = address.last?.name {
                    addr += " "
                    addr += name
                }
                self.lblInfo.text = addr
            }
            
        })
        locationManager.stopUpdatingLocation()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

