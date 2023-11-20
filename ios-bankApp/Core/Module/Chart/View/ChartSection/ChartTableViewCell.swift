//
//  ChartTableViewCell.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 19/11/23.
//

import UIKit

class ChartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var donutChart: DonutChartView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(chartData: [ChartEntity]) {
        donutChart.setupDataChart(chartData: chartData)
        donutChart.setNeedsDisplay()
    }
    
}
