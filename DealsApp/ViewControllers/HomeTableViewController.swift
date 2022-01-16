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
    var selectedCell : DealCell?

    override func viewDidLoad() {
        super.viewDidLoad()

        dealGrabber.getDeals {deals, err in
            if let err = err {
                // Err will happen if status code != 200 && Data not recieved
                print(err)
            } else {
                self.dealsArr = deals
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? DealCell
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "dealSegue", sender: self)
    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? DealViewController {
            guard let selCell = selectedCell else {
                return
            }
            
            dest.image = selCell.dealImage.image
            dest.deal = selCell.deal
            
        }
    }
    

}
