//
//  PaymentViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit
import AVFoundation

class PaymentViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, PaymentPresenterToView {
    
    private let session = AVCaptureSession()
    private var previewView = AVCaptureVideoPreviewLayer()
    
    var presenter: PaymentViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.checkPermission()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.session.stopRunning()
        }
    }
    
    override func viewDidLayoutSubviews() {
        previewView.frame = self.view.bounds
        view.layer.addSublayer(previewView)
    }
    
    func popNavigationController() {
        navigationController?.popViewController(animated: true)
    }
    
    func popUpDeniedAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) else { return print("failed") }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print("error")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        self.previewView.videoGravity = .resizeAspectFill
        self.previewView.session = session
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.session.startRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        guard let metaObject = metadataObjects.first else { return print("object data not found") }
        if metaObject.type == .qr {
            guard let readObject = metaObject as? AVMetadataMachineReadableCodeObject else { return }
            print(readObject.stringValue!)
        }
        
    }
    
}
