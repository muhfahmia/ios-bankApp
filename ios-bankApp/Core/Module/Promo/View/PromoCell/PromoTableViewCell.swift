//
//  PromoTableViewCell.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

class PromoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
