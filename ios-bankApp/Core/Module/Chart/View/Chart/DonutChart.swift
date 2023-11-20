//
//  DonutChart.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 18/11/23.
//

import UIKit
import Domain

class DonutChartView: UIView {

    var dataValues: [CGFloat] = [] // Data values for slices
    var colors: [UIColor] = [] // Colors for respective slices
    let strokeWidth: CGFloat = 50 // Width of the donut chart

    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: bounds.width / 2, y: bounds.height / 2)
        let radius = min(bounds.width, bounds.height) / 2 - strokeWidth / 2
        var startAngle: CGFloat = -.pi / 2 // Start from the top
        let total = dataValues.reduce(0, +)

        for (index, value) in dataValues.enumerated() {
            let endAngle = startAngle + (CGFloat.pi * 2 * value / total)

            let path = UIBezierPath(arcCenter: center,
                                    radius: radius,
                                    startAngle: startAngle,
                                    endAngle: endAngle,
                                    clockwise: true)

            // Set the stroke color and width
            colors[index].setStroke()
            path.lineWidth = strokeWidth

            // Draw the arc
            path.stroke()

            startAngle = endAngle
        }
    }
    
    func setupDataChart(chartData: [ChartEntity]) {
        for chartDatum in chartData {
            dataValues.append(chartDatum.percentage ?? 0)
            colors.append(chartDatum.color ?? UIColor.systemRed)
        }
    }
    
}
