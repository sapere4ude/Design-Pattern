//
//  MainCoordinator.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/21.
//

import Foundation
import UIKit

protocol MainCoordinatorDelegate {
    func didLoggedOut(_ coordinator: MainCoordinator)
}

class MainCoordinator: Coordinator, MainViewControllerDelegate {
    
    var childCoordinators: [Coordinator] = []
    var delegate: MainCoordinatorDelegate?
    
    private var navigationController: UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = MainViewController()
        viewController.view.backgroundColor = .cyan
        viewController.delegate = self
        self.navigationController.viewControllers = [viewController]
    }
    
    func logout() {
        self.delegate?.didLoggedOut(self)
    }
}
