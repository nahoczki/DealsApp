//
//  DealViewController.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/15/22.
//

import UIKit
import WebKit
import SafariServices

class DealViewController: UIViewController, WKNavigationDelegate{
    
    @IBOutlet weak var dealImageView: UIImageView!
    @IBOutlet weak var dealTitleLabel: UILabel!
    @IBOutlet weak var dealDescriptionWebView: WKWebView!
    @IBOutlet weak var dealPostedLabel: UILabel!
    @IBOutlet weak var dealCodeLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    
    
    var image : UIImage!
    var deal: Deal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set element content
        dealImageView.image = image
        dealTitleLabel.text = deal.title
        dealPostedLabel.text = "Posted by \(deal.editor)"
        dealCodeLabel.text = "Code: \(deal.couponCode)"
        
        if (deal.couponCode == "") {
            dealCodeLabel.isHidden = true
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
        
        dealDescriptionWebView.navigationDelegate = self
        
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
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard navigationAction.navigationType == .other || navigationAction.navigationType == .reload  else {
            decisionHandler(.cancel)
            return
        }
        decisionHandler(.allow)
    }
    
    
}
