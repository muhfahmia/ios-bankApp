//
//  PromoDetailViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 15/11/23.
//

import UIKit
import Domain

class PromoDetailViewController: UIViewController, PromoDetailPresenterToView {
    
    @IBOutlet weak var promoImage: UIImageView!
    @IBOutlet weak var promoTitle: UILabel!
    @IBOutlet weak var promoCategory: UILabel!
    @IBOutlet weak var promoDesc: UILabel!
    
    var presenter: PromoDetailViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Promo Detail"
        presenter?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setLargeTitleDisplayMode(.never)
    }
    
    func updateFetchDetailSuccess(promo: PromoEntity) {
        promoImage.image = UIImage(named: promo.image!)
        promoTitle.text = promo.title
        promoCategory.text = promo.category
        promoDesc.text = promo.desc
    }
    
}
