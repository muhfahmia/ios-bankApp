//
//  PaymentPresenter.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import Foundation
import AVFoundation
import UIKit

class PaymentPresenter: PaymentViewToPresenter {
    
    var view: PaymentPresenterToView?
    var router: PaymentRouter?
    
    func checkPermission() {
        let statusPermission = AVCaptureDevice.authorizationStatus(for: .video)
        switch statusPermission {
        case .authorized:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { self?.view?.popNavigationController(); return }
                self?.view?.setupCamera()
            }
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { (success) in
                if success == true {
                    print("permission granted")
                } else {
                    print("permission denied")
                }
            }
            print("notDetermined")
            
        case .restricted:
            print("restricted")
        case .denied:
            cameraDenied()
        @unknown default:
            print("unknown default")
        }
    }
    
    func cameraDenied() {
        DispatchQueue.main.async { [self] in
           var alertText = ""
           var alertButton = ""
           var goAction = UIAlertAction(title: alertButton, style: .default, handler: nil)
           if UIApplication.shared.canOpenURL(URL(string: UIApplication.openSettingsURLString)!)
           {
               alertText = "We need access your Camera"
               alertButton = "Go"
               goAction = UIAlertAction(title: alertButton, style: .default, handler: {(alert: UIAlertAction!) -> Void in
                   UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
               })
           }
           let alert = UIAlertController(title: "Permission", message: alertText, preferredStyle: .alert)
            alert.addAction(goAction)
            view?.popNavigationController()
            view?.popUpDeniedAlert(alert: alert)
        }
    }

}
