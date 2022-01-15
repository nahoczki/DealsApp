//
//  DealViewController.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/15/22.
//

import UIKit
import WebKit

class DealViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var dealImage: UIImageView!
    @IBOutlet weak var dealTitle: UILabel!
    @IBOutlet weak var dealDescriptionWebView: WKWebView!
    
    var image : UIImage!
    var deal: Deal!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dealImage.image = image
        dealTitle.text = deal.title
        //dealDescription.text = deal.longDescription
        
        let htmlToDisplay = """
                                <html>
                                \(Constants.Styling.descriptionCSS)
                                    <body>
                                    \(deal.longDescription)
                                    </body>
                                </html>
                            """
        
        dealDescriptionWebView.loadHTMLString(htmlToDisplay, baseURL: nil)
        dealDescriptionWebView.navigationDelegate = self

        // Do any additional setup after loading the view.
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        guard navigationAction.navigationType == .other || navigationAction.navigationType == .reload  else {
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
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
