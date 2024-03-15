//
//  ModuleFactory.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//

import UIKit

class ModuleFactory {
    
    // MARK: - Auth Flow Modules
    func createLoginModule() -> LoginViewController {
        LoginViewController()
    }

    func createRegistrationModule() -> RegistrationViewController {
        RegistrationViewController()
    }
    
    func createCodeModule() -> CodeViewController {
        CodeViewController()
    }
    
    // MARK: - Main Flow Modules
    
    func createBranchesModalModule() -> BranchesModalViewController {
        BranchesModalViewController()
    }
    
    func createTabBarModule() -> TabBarController {
        TabBarController()
    }
    
    func createMainModule() -> MainViewController {
        MainViewController()
    }
    
    func createSearchModule() -> SearchViewController {
        SearchViewController()
    }
    
    func createMenuModule() -> MenuViewController {
        MenuViewController()
    }
    
    func createItemDetailsModule() -> ItemDetailsViewController {
        ItemDetailsViewController()
    }
    
    func createCoffeeSupplementsModule() -> CoffeeSupplementsViewController {
        CoffeeSupplementsViewController()
    }
    
    func createErrorModule() -> ErrorViewController {
        ErrorViewController()
    }
    
    // MARK: - Basket Flow Modules
    func createBasketModule() -> BasketViewController {
        BasketViewController()
    } // TODO: -
    
    // MARK: - Branches Flow Modules
    func createBranchesModule() -> BranchesViewController {
        BranchesViewController()
    } // TODO: -
    
    // MARK: - Profile Flow Modules
    func createProfileModule() -> ProfileViewController {
        ProfileViewController()
    } // TODO: -
    
}
