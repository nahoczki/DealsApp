//
//  DealViewController.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/15/22.
//

import UIKit
import WebKit
import SafariServices

class DealViewController: UIViewController{
    
    @IBOutlet weak var dealImage: UIImageView!
    @IBOutlet weak var dealTitle: UILabel!
    @IBOutlet weak var dealDescriptionWebView: WKWebView!
    @IBOutlet weak var dealPosted: UILabel!
    @IBOutlet weak var dealCode: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    
    var image : UIImage!
    var deal: Deal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set element content
        dealImage.image = image
        dealTitle.text = deal.title
        dealPosted.text = "Posted by \(deal.editor)"
        dealCode.text = "Code: \(deal.couponCode)"
        
        if (deal.couponCode == "") {
            dealCode.isHidden = true
        }
        
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
        // Styling
        navigationItem.largeTitleDisplayMode = .never
        
        goButton.layer.cornerRadius = Constants.Styling.imageCornerRadius
    }
    
    @IBAction func goOnClick(_ sender: Any) {
        if let url = URL(string: deal.goLink) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    
}
