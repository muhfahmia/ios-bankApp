//
//  PaymentViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit
import AVFoundation

class PaymentViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, PaymentPresenterToView {
    
    @IBOutlet weak var backBtn: UIButton!
    
    private let session = AVCaptureSession()
    private var previewView = AVCaptureVideoPreviewLayer()
    private var isSessionActive = false
    
    var presenter: PaymentViewToPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backBtn.addAction(UIAction(handler: { [weak self] _ in
            self?.popNavigationController()
        }), for: .touchUpInside)
        presenter?.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopSession()
    }
    
    override func viewDidLayoutSubviews() {
        previewView.frame = self.view.bounds
        view.layer.addSublayer(previewView)
        view.bringSubviewToFront(backBtn)
    }
    
    func popNavigationController() {
        navigationController?.popViewController(animated: true)
    }
    
    func popUpDeniedAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
    
    func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Camera support only on Device not Simulator xCode")
            return
        }
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print("error")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr, .ean13, .ean8, .code128, .upce]
        self.previewView.videoGravity = .resizeAspectFill
        self.previewView.session = session
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.session.startRunning()
        }
    }
    
    private func stopSession() {
        isSessionActive = true
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.session.stopRunning()
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard let metadataObject = metadataObjects.first as? AVMetadataMachineReadableCodeObject,
        metadataObject.type == .qr,
        let stringValue = metadataObject.stringValue else { return }
        if !stringValue.isEmpty {
            if !isSessionActive {
                popNavigationController()
                presenter?.doPay(vc: self, payload: stringValue)
            }
            stopSession()
        }
    }
}
