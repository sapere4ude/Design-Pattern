//
//  Protocol.swift
//  CoordinatorPattern
//
//  Created by Kant on 2023/05/20.
//

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
