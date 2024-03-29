//
//  LoginCoordinator.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/20.
//

import Foundation
import UIKit

protocol LoginCoordinatorDelegate {
    func didLoggedIn(_ coordinator: LoginCoordinator)
}


class LoginCoordinator: Coordinator, LoginViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: LoginCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .brown
        viewController.delegate = self
        self.navigationController?.viewControllers = [viewController]
    }
    
    func login() {
        self.delegate?.didLoggedIn(self)
    }
}
