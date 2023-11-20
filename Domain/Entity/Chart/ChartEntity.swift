//
//  ChartEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 19/11/23.
//

import UIKit

public protocol ChartEntity {
    var label: String? { get }
    var percentage: Double? { get }
    var color: UIColor? { get }
}
