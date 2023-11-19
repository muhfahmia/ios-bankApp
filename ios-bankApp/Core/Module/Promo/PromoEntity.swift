//
//  PromoEntity.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

protocol PromoEntity {
    var promoID: String? { get }
    var image: String? { get }
    var category: String? { get }
    var title: String? { get }
    var desc: String? { get }
}
