//
//  DealGrabber.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/14/22.
//

import Foundation
import Alamofire
import SwiftyJSON

class DealGrabber {
    
    // Creates get request to API; Completes with either ([Deal], nil) or ([], "Error msg")
    func getDeals(_ completion : @escaping (Array<Deal>, String?) -> ()) {
        AF.request(Constants.API.URL, method: .get).response { res in
            if (res.response?.statusCode != 200) {
                completion([], "Error: Status code not 200")
                return
            }
            
            if let data = res.data {
                var dealsReturn : Array<Deal> = []

                let jsonData = JSON(data)
                
                for deal in jsonData["deals"].arrayValue {
                    let title = deal["headline"].stringValue
                    let shortDescription = deal["description_preview"].stringValue
                    let longDescription = deal["description"].stringValue
                    let image = deal["image_urls"]["original"].stringValue
                    
                    dealsReturn.append(Deal(title: title, shortDescription: shortDescription, longDescription: longDescription, image: image))
                }
                
                completion(dealsReturn, nil)
            } else {
                completion([], "Error: No Data")
                return
            }
        }
    }
    
}
