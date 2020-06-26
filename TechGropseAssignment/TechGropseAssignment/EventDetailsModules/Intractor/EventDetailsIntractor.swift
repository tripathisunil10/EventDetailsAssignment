//
//  EventDetailsIntractor.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
class EventDetailsIntractor: EventDetailsInteractorProtocol {
    
    var presenter: EventDetailsInteractorPresenterProtocol?
   // var semaphore = DispatchSemaphore (value: 0)
    
    func createRequestToEventDetailsListApi(with paramDict: [String : Any]) {
        SHOW_ACTIVITY()
        let parameters = [
          [
            "key": "latitude",
            "value": "28.1245",
            "type": "text"
          ],
          [
            "key": "longitude",
            "value": "78.1245",
            "type": "text"
          ],
          [
            "key": "event_id",
            "value": "12",
            "type": "text"
          ],
          [
            "key": "user_id",
            "value": "00",
            "type": "text"
          ]] as [[String : Any]]

        let boundary = "Boundary-\(UUID().uuidString)"
        var body = ""
          var _: Error? = nil
        for param in parameters {
          if param["disabled"] == nil {
            let paramName = param["key"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            let paramType = param["type"] as! String
            if paramType == "text" {
              let paramValue = param["value"] as! String
              body += "\r\n\r\n\(paramValue)\r\n"
            } else {
              let paramSrc = param["src"] as! String
              let fileData = try? NSData(contentsOfFile:paramSrc, options:[]) as Data
              let fileContent = String(data: fileData!, encoding: .utf8)!
              body += "; filename=\"\(paramSrc)\"\r\n"
                + "Content-Type: \"content-type header\"\r\n\r\n\(fileContent)\r\n"
            }
          }
        }
        body += "--\(boundary)--\r\n";
        let postData = body.data(using: .utf8)

        var request = URLRequest(url: URL(string: "http://saudicalendar.com/api/user/getEventDetail")!,timeoutInterval: Double.infinity)
        request.addValue("ci_session=tbdei4l2vlg8i61rqj1vdr22dorn7rg6", forHTTPHeaderField: "Cookie")
        request.addValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

        request.httpMethod = "POST"
        request.httpBody = postData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            HIDE_ACTIVITY()
          guard let data = data else {
           
            SHOW_ALERT_WITH(Message: error?.localizedDescription ?? "")
            return
          }
            
            do{
               
                let object = try JSONDecoder().decode(EventDetailsMaster.self, from: data)
                 DispatchQueue.main.async {
                  self.presenter?.eventDetailAPISuccessResponse(eventMaster: object)
                }
            }
            catch let error{
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async {
                self.presenter?.eventDetailAPIFailedResponse(errorMessage:error.localizedDescription)
                }
            
            }
            
        //self.semaphore.signal()
        }

        task.resume()
        //semaphore.wait()

    }
   
    
    
}
