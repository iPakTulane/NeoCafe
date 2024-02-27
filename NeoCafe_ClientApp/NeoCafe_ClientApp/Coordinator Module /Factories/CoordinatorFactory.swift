//
//  CoordinatorFactory.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//

import Foundation
import UIKit

class CoordinatorFactory {
    
    func createAppCoordinator(navigationController: UINavigationController) -> AppCoordinator {
        return AppCoordinator(navigationController: navigationController)
    }
    
    func createAuthFlowCoordinator(navigationController: UINavigationController) -> AuthFlowCoordinator {
        return AuthFlowCoordinator(navigationController: navigationController)
    }

    func createMainFlowCoordinator(navigationController: UINavigationController) -> MainFlowCoordinator {
        return MainFlowCoordinator(navigationController: navigationController)
    }
    
//    func createBasketFlowCoordinator(navigationController: UINavigationController) -> BasketFlowCoordinator {
//        return BasketFlowCoordinator(navigationController: navigationController)
//    }
    
//    func createBranchesFlowCoordinator(navigationController: UINavigationController) -> BranchesFlowCoordinator {
//        return BranchesFlowCoordinator(navigationController: navigationController)
//    }
    
//    func createProfileFlowCoordinator(navigationController: UINavigationController) -> ProfileFlowCoordinator {
//        return ProfileFlowCoordinator(navigationController: navigationController)
//    }
    
}
