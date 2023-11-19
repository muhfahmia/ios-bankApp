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

    func viewDidLoad() {
        checkPermission()
    }
    
    func doPay(vc: UIViewController, payload: String) {
        let payloads = payload.components(separatedBy: ".")
        let amount = Double(payloads.endIndex)
        print(amount)
        guard payloads.count == 4 else {
            print("Payload incorrect: \(payloads.count)")
            return
        }
        router?.routeToTransaction(vc: vc, payload: payload)
    }
    
    func checkPermission() {
        let statusPermission = AVCaptureDevice.authorizationStatus(for: .video)
        switch statusPermission {
        case .authorized:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                guard granted else { self?.view?.popNavigationController()
                    return
                }
                self?.view?.setupCamera()
            }
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] (success) in
                if success == true {
                    self?.view?.setupCamera()
                } else {
                    DispatchQueue.main.async {
                        self?.view?.popNavigationController()
                    }
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
