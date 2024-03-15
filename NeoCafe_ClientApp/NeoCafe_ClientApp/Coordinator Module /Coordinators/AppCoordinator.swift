//
//  AppCoordinator.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//  

import UIKit

class AppCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private var childCoordinators: [Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isAuth = checkAuthentication()
        if !isAuth {
            showAuthFlow()
        } else {
            showMainFlow()
        }
    }
    
    private func checkAuthentication() -> Bool {
        // Check if the user is logged in
        if let userToken = UserDefaults.standard.string(forKey: "userToken") {
            return !userToken.isEmpty
        }
        return false
    }
    
    
    private func showAuthFlow() {
        let authFlowCoordinator = CoordinatorFactory().createAuthFlowCoordinator(navigationController: navigationController)
        childCoordinators.append(authFlowCoordinator)
        
        authFlowCoordinator.flowCompletionHandler = { [weak self] in
            self?.showMainFlow()
        }
        authFlowCoordinator.start()
    }

    private func showMainFlow() {
        navigationController.setViewControllers([MainViewController()], animated: true)
    }
    
}
