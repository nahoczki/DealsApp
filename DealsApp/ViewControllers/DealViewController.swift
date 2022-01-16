//
//  DealViewController.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/15/22.
//

import UIKit
import WebKit

class DealViewController: UIViewController{

    @IBOutlet weak var dealImage: UIImageView!
    @IBOutlet weak var dealTitle: UILabel!
    @IBOutlet weak var dealDescriptionWebView: WKWebView!
    
    var image : UIImage!
    var deal: Deal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set element content
        dealImage.image = image
        dealTitle.text = deal.title
        
        // Prepare HTML
        let htmlToDisplay = """
                                <html>
                                \(Constants.Styling.descriptionCSS)
                                    <body>
                                    \(deal.longDescription)
                                    </body>
                                </html>
                            """
        
        // Load HTML
        dealDescriptionWebView.loadHTMLString(htmlToDisplay, baseURL: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.largeTitleDisplayMode = .never
    }

}
