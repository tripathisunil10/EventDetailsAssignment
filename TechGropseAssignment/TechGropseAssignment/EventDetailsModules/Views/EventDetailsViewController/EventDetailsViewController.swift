//
//  EventDetailsViewController.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
class EventDetailsViewController: UIViewController,EventDetailsPresenterToViewProtocol {
    
    @IBOutlet weak var eventImgCollVW: UICollectionView!{
        didSet{
            eventImgCollVW.delegate = self
            eventImgCollVW.dataSource = self
        }
    }
    var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    var EventDetailPresenter: EventDetailsPresenterProtocols?
    
    var evenDetailsObj:EventDetailsMaster?
    @IBOutlet weak var addButton: UIButton!{
        didSet{
            addButton.layer.cornerRadius = 5.0
            addButton.clipsToBounds      = true
        }
    }
    
    @IBOutlet weak var promoteEventButton: UIButton!{
        didSet{
           promoteEventButton.layer.cornerRadius = 5.0
           promoteEventButton.clipsToBounds      = true
        }
    }
    
    @IBOutlet weak var eventDetailsTableView: UITableView!{
        didSet{
            eventDetailsTableView.delegate   = self
            eventDetailsTableView.dataSource = self
        }
    }
    @IBOutlet var tableHeadeVW: UIView!
    @IBOutlet weak var segmentVW: CustomSegmentedControl!{
        didSet{
            segmentVW.setButtonTitles(buttonTitles: ["Overview","Additional info","Contact","Comment"])
            segmentVW.selectorViewColor = UIColor().colorWithHexString(hex: "#00C0EE")
            segmentVW.selectorTextColor = .darkGray
        }
    }
    @IBOutlet weak var nationalFestivalLabel: UILabel!
    @IBOutlet weak var nationalDayLabel: UILabel!
    @IBOutlet weak var infoView: UIView!{
        didSet{
           infoView.layer.cornerRadius = 5.0
            infoView.layer.borderWidth = 0.5
           infoView.clipsToBounds      = true
        }
    }
    @IBOutlet weak var entertainmentLabel: UILabel!
    @IBOutlet weak var entertainmentVw: UIView!{
        didSet{
          entertainmentVw.layer.cornerRadius = 5.0
          entertainmentVw.clipsToBounds      = true
        }
    }
    @IBOutlet weak var paidEventBtn: UIButton!{
        didSet{
            paidEventBtn.layer.cornerRadius = 5.0
            paidEventBtn.clipsToBounds      = true
        }
    }
    @IBOutlet weak var eventImg: UIImageView!
    
    @IBOutlet weak var featuredLabel: UILabel!
    @IBOutlet weak var featuredVW: UIView!{
        didSet{
          featuredVW.layer.cornerRadius = 5.0
          featuredVW.clipsToBounds      = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialLoadView()
    }
    
}


extension EventDetailsViewController:EventDetailsViewProtocol{
    
    func showEventDetailsAPiSuccess(eventMaster:EventDetailsMaster?) {
        evenDetailsObj = eventMaster
        self.eventDetailsTableView.reloadData()
        self.eventImgCollVW.reloadData()
    }
    
    func showEventDetailsApiError(error: String) {
        
    }
    
}

//MARK:- UITableViewDelegate
extension EventDetailsViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
}
//MARK:- UITableViewDataSource
extension EventDetailsViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventDetailPresenter?.tblDelegate?.delegateNumberOfRowsInSectiontableView(tableView, numberOfRowsInSection: section, Presenter: EventDetailPresenter) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         return EventDetailPresenter?.tblDelegate?.cellForitem(tableView: tableView, indexPath: indexPath, Presenter: EventDetailPresenter) ?? UITableViewCell()
    }
    
}
//MARK:- Initial Function Load

extension EventDetailsViewController{
    
    private func initialLoadView(){
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.navigationController?.isNavigationBarHidden = true
        eventDetailsTableView.tableHeaderView = tableHeadeVW
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 100))
         eventDetailsTableView.tableFooterView = view
        entertainmentLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 2)
        EventDetailPresenter?.tblDelegate?.registerTableViewCellInToNib(tableView: eventDetailsTableView)
        
        eventImgCollVW.register(UINib.init(nibName: "EventImgCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "EventImgCollectionViewCell")
         callAPiGetEventDetails()

    }
    
    private func callAPiGetEventDetails(){
      
        let parmDict:[String:Any] = ["latitude":28.1245,
                                     "longitude":78.1245,
                                     "event_id":12,
                                     "User_id":0]
        EventDetailPresenter?.createRequestToConnectServerEventDetailsApi(with:parmDict)
    }
    
   
    
}
extension EventDetailsViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
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
