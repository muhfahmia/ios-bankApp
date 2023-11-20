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
        setupChart()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupChart() {
        donutChart.backgroundColor = .white
        donutChart.dataValues = [30, 55, 15] // Example data values for the donut chart slices
        donutChart.colors = [.red, .green, .blue]
    }
    
}
