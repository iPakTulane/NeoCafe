//
//  MainFlowCoordinator.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 21/02/24.
//

import UIKit

class MainFlowCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?
    
    private let moduleFactory = ModuleFactory()
    private var userData = MockUser(email: nil, code: nil)
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showBranchesModalModule()
    }
    
    private func showBranchesModalModule() {
        let controller = moduleFactory.createBranchesModalModule()
        
        controller.completionHandler = { [weak self] value in
            self?.userData.email = value
            self?.showMenuModule()
        }
        navigationController.pushViewController(controller, animated: true)
    }
    private func showMenuModule() {
        // TODO: - To complete showMenuModule()
    }
    
}
