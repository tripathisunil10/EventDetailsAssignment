//
//  EventDetailsViewController.swift
//  TechGropseAssignment
//
//  Created by Admin on 25/06/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

public class AlamofireRequest:NSObject{
    var requestHTTP:DataRequest? = nil
    
   public init(BaseURL:String,Method:HTTPMethod,Headers:[String:String],Parameters:[String:Any]){
    super.init()
    SHOW_ACTIVITY()
    print( """
        *** Request ***
        url : \(BaseURL)
        header : \(Headers)
        parameters : \(Parameters)
        ***************
        """
        )
    
       self.requestHTTP = Alamofire.request(BaseURL, method: Method, parameters: Parameters, headers: Headers)
    
    
    }
    
    
    //file upload with progress
    
    public init(BaseURL:String,Method:HTTPMethod,Headers:[String:String],Parameters:[String:Any],MultiPartData:[(file:Data,fileName:String,MIMEtype:String,key:String)],progress:((Float)->Void)?,successResultM: @escaping (([String:Any])->Void),errorResultM: @escaping ((NSError)->Void)){
        SHOW_ACTIVITY()
        super.init()
        print( """
            *** Request ***
            url : \(BaseURL)
            header : \(Headers)
            parameters : \(Parameters)
            ***************
            """
        )
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in Parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }
          _ =  MultiPartData.map({
                multipartFormData.append($0.file, withName: $0.key, fileName: $0.fileName, mimeType: $0.MIMEtype)
            })

        }, usingThreshold: UInt64.init(), to: BaseURL, method: .post, headers: Headers) { (dataResponse) in
            // HTTP Error Handling
            switch dataResponse {
            case .success(let upload, _, _):
                self.requestHTTP = upload
//                self.requestHTTP?.downloadProgress(closure: { (downloading) in
//                    progress?(Float(downloading.completedUnitCount/downloading.totalUnitCount))
//                })
                self.responseOfHTTP(successResult: { response,data  in
                    successResultM(response)
                }, errorResult: { (error) in
                    errorResultM(error)
                })
            case .failure(let error):
                SHOW_ALERT_WITH(Message: error.localizedDescription )
            }
        }
    }

    func responseOfHTTP(successResult: @escaping (([String:Any],Data)->Void),errorResult: @escaping ((NSError)->Void)){
        self.requestHTTP?.responseJSON { (dataResponse) in
        // HTTP Error Handling
            HIDE_ACTIVITY()
            switch dataResponse.error {
            case .none:
            // API Error Handling
                let respString:String=String(data: (dataResponse.data)!, encoding: String.Encoding.utf8)!
                print(respString)
                
                if let responseDictionary = dataResponse.value as? [String:Any] ,let  data = dataResponse.data{
                    if let APIErrorCode = responseDictionary["statusCode"] as? Int{
                        switch APIErrorCode{
                            case 200:
                                successResult(responseDictionary,data)
                            case 403:
                                successResult(responseDictionary,data)
                            case 300:
                                successResult(responseDictionary,data)
                            case 400:
                                debugPrint("Handle Here")
                             successResult(responseDictionary,data)
                                default:
                                if let message = responseDictionary["message"] as? String{
                                    let userInfo: [String : Any] =
                                        [NSLocalizedDescriptionKey :  NSLocalizedString("Unauthorized", value: message, comment: "")]
                                    let errorAPI = NSError(domain: "APIError", code: APIErrorCode, userInfo: userInfo)
                                    errorResult(errorAPI)
                            }
                        }
                    }
                }
            case .some(_):
                if let errorMessage = dataResponse.error?.localizedDescription{
                    SHOW_ALERT_WITH(Message: errorMessage)
                }
            }
        }
    }
   
}
