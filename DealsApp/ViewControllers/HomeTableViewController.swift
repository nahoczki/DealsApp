//
//  HomeTableViewController.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/14/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let dealGrabber : DealGrabber = DealGrabber()
    var dealsArr : Array<Deal> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true

        dealGrabber.getDeals {deals, err in
            if let err = err {
                fatalError(err)
            } else {
                self.dealsArr = deals
                self.tableView.reloadData()
                // Do something
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dealsArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let deal = dealsArr[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dealCell", for: indexPath) as! DealCell
        
        cell.deal = deal
        cell.titleLabel.text = deal.title
        cell.descriptionLabel.text = deal.shortDescription
        cell.dealImage.loadImage(mediaUrl: deal.image)
        

        return cell
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
