//
//  PromoModel.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

struct PromoModel: PromoEntity {
    var promoID: String?
    var image: String?
    var category: String?
    var title: String?
    var desc: String?
    
    static let promoData = [
        PromoModel(
            promoID: "promo-1",
            image: "promo-1-bni",
            category: "E-Commerce",
            title: "E-COMMERCE EVERYDAY",
            desc: """
            Syarat dan ketentuan
            1. MAPCLUB
                • Berlaku setiap hari Minggu hingga 31 Desember 2023.
                • Berlaku untuk semua Kartu Debit BNI berlogo Mastercard.
                • Diskon 10% (maksimum Rp150.000) minimum transaksi Rp1.250.000.
                • Nominal diskon akan langsung mengurangi total transaksi yang dilakukan pelanggan setelah menginput kode promo. Kode Promo bulan Oktober sebagai berikut:
                    • 5 November 2023 (BNISUNNOVDB1).
                    • 12 November 2023 (BNISUNNOVDB2).
                    • 19 November 2023 (BNISUNNOVDB3).
                    • 26 November 2023 (BNISUNNOVDB4).
                • Promo berlaku untuk 5 orang pertama per hari selama periode program.
                • Promo berlaku untuk 1 cardholder/transaksi/hari.
            Info lebih lanjut hubungi BNI Call 1500046
            """
        ), PromoModel(
            promoID: "promo-2",
            image: "promo-2-bni",
            category: "Gadget",
            title: "Mapclub Launching Iphone 15",
            desc: """
            Syarat dan ketentuan
            • Cashback 5% (maksimum Rp1.000.000) dengan minimum transaksi Rp16.499.000.
            • Berlaku untuk 30 transaksi selama periode program.
            • Berlaku untuk 1 kali transaksi/kartu/hari.
            • Berlaku untuk transaksi pembelian Iphone 15 di mobile app & webisite Mapclub.
            • Promo dapat digabungkan dengan cicilan 0% tenor 3 & 6 bulan.
            • Promo ini tidak dapat digabungkan dengan promo diskon/cashback lainnya.
            • Berlaku untuk semua Kartu Kredit BNI, kecuali Silver, Corporate & Hasanah.
            • Berlaku di website & mobile app Mapclub - bit.ly/mapclubip15
            """
        ), PromoModel(
            promoID: "promo-3",
            image: "promo-3-bni",
            category: "Fashion",
            title: "HAKANA",
            desc: """
            Syarat dan ketentuan
            • Hemat Hingga 50% dengan BNI Reward Points
            • Tidak ada minimum transaksi
            • Berlaku untuk semua jenis Kartu Kredit BNI kecuali Corporate Card, Co Brand Garuda & Hasanah Card
            • Info lebih lanjut hubungi BNI Call 1500046
            """
        )
    ]
}


