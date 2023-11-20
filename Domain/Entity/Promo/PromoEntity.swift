//
//  PromoEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 20/11/23.
//

import Foundation

public protocol PromoEntity {
    var promoID: String? { get }
    var image: String? { get }
    var category: String? { get }
    var title: String? { get }
    var desc: String? { get }
}
