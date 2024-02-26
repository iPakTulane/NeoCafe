//
//  AuthFlowCoordinator.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//  

import UIKit

class AuthFlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private let moduleFactory = ModuleFactory()
    private var userData = MockUser(email: nil, code: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let isAuth = checkAuthentication()
        if !isAuth {
            showLoginModule()
        } else {
            showRegistrationModule()
        }
    }
    
    private func checkAuthentication() -> Bool {
        // Check if the user is logged in
        if let userToken = UserDefaults.standard.string(forKey: "userToken") {
            return !userToken.isEmpty
        }
        return false
    }
        
    private func showLoginModule() {
        let controller = moduleFactory.createLoginModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.email = value
            self?.showCodeModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showRegistrationModule() {
        let controller = moduleFactory.createRegistrationModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.email = value
            self?.showCodeModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    
    private func showCodeModule() {
            let controller = moduleFactory.createCodeModule()
            
            controller.completionHandler = { [weak self] isCodeValid in
                // Assuming 'isCodeValid' is a Bool
                if isCodeValid {
                    self?.showMainFlow()
                } else {
                    // alert or other action if code is not valid
                }
            }
            
            navigationController.pushViewController(controller, animated: true)
        }
    
    private func showMainFlow() {
        navigationController.setViewControllers([MainViewController()], animated: true)
    }
}
