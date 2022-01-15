//
//  DealCell.swift
//  DealsApp
//
//  Created by Zoli Nahoczki on 1/15/22.
//

import UIKit

class DealCell: UITableViewCell {
    
    var deal: Deal!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dealImage: UIImageViewWithLoader!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
