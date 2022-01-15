//
//  Constants.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/14/22.
//

import Foundation

struct Constants {
    
    struct API {
        
        static let URL : String = "http://content-static.bradsdeals.com/api/v1/deals.json"
        
    }
    
    struct Styling {
        
        static let imageCornerRadius = 10.0
        
        static let descriptionCSS = """
                                        <style>
                                            body {
                                                font-family: -apple-system, BlinkMacSystemFont, sans-serif;
                                                font-size: 55px;
                                            }
                                            a {
                                                color: #549F93;
                                                text-decoration: none;
                                            }
                                        </style>
                                    """
        
    }
    
}
