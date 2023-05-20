//
//  LoginCoordinator.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/20.
//

import Foundation
import UIKit

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = LoginViewController()
        viewController.view.backgroundColor = .brown
        self.navigationController?.viewControllers = [viewController]
    }
}
