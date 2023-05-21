//
//  LoginViewController.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/20.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item = UIBarButtonItem(title: "로그인",
                                   style: .plain,
                                   target: self,
                                   action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print(#fileID, #function, #line, "deinit")
    }
    
    @objc
    func loginButtonDidTap() {
        self.delegate?.login()
    }
}
