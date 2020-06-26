//
//  EventLocationTableViewCell.swift
//  TechGropseAssignment
//
//  Created by Admin on 26/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class EventLocationTableViewCell: UITableViewCell,IdentifiableCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var mapGmsVW: GMSMapView!
    @IBOutlet weak var locationLabel: UILabel!
    let marker = GMSMarker()
    var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    static var identifier: String{
        return "\(self)"
    }
    @IBOutlet weak var contentVW: UIView!{
        didSet{
            contentVW.layer.cornerRadius = 5.0
            contentVW.clipsToBounds = true
        }
    }
    var objeEvent:EventData?{
          didSet{
              if let country = objeEvent?.ev_country{
                countryNameLabel.text = country
                  
              }
            if let country = objeEvent?.ev_address{
              addressLabel.text = country
                
            }
            if let location = objeEvent?.ev_city{
              locationLabel.text = location
                
            }
          }
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
       setInitialLoadView()
    }

   
    
}
extension EventLocationTableViewCell : GMSMapViewDelegate {
    
    
    private func setInitialLoadView(){
        getCurrentLatLong()
    }
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position =  CLLocationCoordinate2D(latitude: position.latitude, longitude: position.longitude)
        marker.icon  = UIImage(named: "ic_distance")
        marker.isDraggable = false
        marker.map = mapGmsVW
    }
    func getCurrentLatLong(){
        currentLocation = locationManager.location
        
        let long = currentLocation?.coordinate.longitude ?? 0.0
        let lat = currentLocation?.coordinate.latitude ?? 0.0
        
        let clLocation = CLLocationCoordinate2D(latitude: lat, longitude: long)
        showMarker(position: clLocation)
        marker.isDraggable = false
        mapGmsVW.delegate = self
        marker.map = mapGmsVW
        mapGmsVW.clear()
        locationManager.stopUpdatingLocation()

    }

}

// MARK: - CLLocationManagerDelegate

extension EventLocationTableViewCell: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        mapGmsVW.isMyLocationEnabled = true
        mapGmsVW.settings.myLocationButton = true
    }
    

    
    func mapView(_ mapView: GMSMapView, didEndDragging marker: GMSMarker) {
        print("Position of marker is = \(marker.position.latitude),\(marker.position.longitude)")
        
        print("Position of marker is = \(marker.position.latitude),\(marker.position.longitude)")
    }
    func mapView(_ mapView: GMSMapView, didBeginDragging marker: GMSMarker) {
        print("didBeginDragging")
    }
    func mapView(_ mapView: GMSMapView, didDrag marker: GMSMarker) {
        print("didDrag")
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        print("didTap")
        return true
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
    }
}
