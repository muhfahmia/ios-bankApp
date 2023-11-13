//
//  AppDelegate.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 13/11/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let injection: Injection = AppInjection()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let router: HomeRouter = injection.resolve()
        router.appRoute(window: window)
        
        return true
    }

}

