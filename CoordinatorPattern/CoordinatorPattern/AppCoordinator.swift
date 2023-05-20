//
//  AppCoordinator.swift
//  Coordinator
//
//  Created by Kant on 2023/05/20.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        self.isLoggedIn == true ? self.showMainViewController() : self.showLoginViewController()
    }
    
    private func showMainViewController() {
        
    }
    
    private func showLoginViewController() {
        
    }
}
