//
//  HomeTabBarController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    private let router: HomeRouter

    init(router: HomeRouter) {
      self.router = router
      super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      configureTabBar()
    }
    
    private func configureTabBar() {
        
        tabBar.barTintColor = UIColor.backgroundColor
        tabBar.backgroundColor = UIColor.backgroundColor

        let bankTab = createTabController(vc: router.bankAccountVC, image: setImageTab(imageSystem: "banknote.fill"), title: "Bank Account")
        let promoTab = createTabController(vc: router.promoVC, image: setImageTab(imageSystem: "giftcard.fill"), title: "Promo")
        let chartTab = createTabController(vc: router.chartVC, image: setImageTab(imageSystem: "chart.pie.fill"), title: "Chart")
        setViewControllers([bankTab, promoTab, chartTab], animated: true)
    }
    
    private func createTabController(vc: UIViewController, image: UIImage, title: String) -> UINavigationController {
      let tabController = UINavigationController(rootViewController: vc)
        tabController.title = title
        tabController.tabBarItem.image = image
        tabController.tabBarItem.selectedImage = image
      return tabController
    }
    
    private func setImageTab(imageSystem: String) -> UIImage {
        let image = UIImage(systemName: imageSystem)!.withBaselineOffset(fromBottom: 8)
        return image
    }
}
