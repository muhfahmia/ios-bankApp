//
//  HistoryCellTableViewCell.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

class HistoryCellTableViewCell: UITableViewCell {

    @IBOutlet weak var transImage: UIImageView!
    @IBOutlet weak var transID: UILabel!
    @IBOutlet weak var merchant: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var paymentDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
