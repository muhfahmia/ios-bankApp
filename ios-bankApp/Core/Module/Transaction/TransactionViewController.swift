//
//  TransactionViewController.swift
//  ios-bankApp
//
//  Created by Muhammad Fahmi on 14/11/23.
//

import UIKit

class TransactionViewController: UIViewController, TransactionPresenterToView {
    
    @IBOutlet weak var transactionID: UITextField!
    @IBOutlet weak var bankName: UITextField!
    @IBOutlet weak var merchant: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var paymentSubmit: UIButton!
    
    var presenter: TransactionViewToPresenter?
    var payload: String?
    
    init(payload: String) {
        self.payload = payload
        super.init(nibName: String(describing: TransactionViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad(payload: payload ?? "")
    }
    
    func onGetTransactionPayloadSuccess() {
        transactionID.text = presenter?.transEntity?.transID
        bankName.text = presenter?.transEntity?.bankName
        merchant.text = presenter?.transEntity?.merchant
        amount.text = String().rupiahFormat(from: presenter?.transEntity?.amount ?? 0)
    }
    
    func onTransactionSuccess() {
    }
    
    func onTransactionFailed() {
        print("fromView: failed")
    }
    
}
