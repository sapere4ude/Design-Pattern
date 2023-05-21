//
//  MainViewController.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/21.
//

import Foundation
import UIKit

protocol MainViewControllerDelegate {
    func logout()
}

class MainViewController: UIViewController {

    var delegate: MainViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그아웃",
                                   style: .plain,
                                   target: self,
                                   action: #selector(logoutButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print(#fileID, #function, #line, "deinit")
    }
    
    @objc
    func logoutButtonDidTap() {
        self.delegate?.logout()
    }
}
