//
//  PromoModel.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit

struct ChartModel: ChartEntity {
    var label: String?
    var percentage: Double?
    var color: UIColor?
    
    static let chartDataModel: [ChartEntity] = [
        ChartModel(label: "Topup Gopay", percentage: 20, color: .systemMint),
        ChartModel(label: "QRIS Payment", percentage: 25, color: .systemTeal),
        ChartModel(label: "Debit", percentage: 55, color: .systemBrown)
    ]
}


