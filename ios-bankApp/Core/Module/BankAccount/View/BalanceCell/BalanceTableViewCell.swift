//
//  BalanceTableViewCell.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    @IBOutlet weak var accountBalance: UILabel!
    @IBOutlet weak var btnPayment: UIButton!
    
    var doPaymentClick: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnPayment.addTarget(self, action: #selector(doPayment), for: .touchUpInside)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @objc func doPayment() {
        doPaymentClick!()
    }
    
}
