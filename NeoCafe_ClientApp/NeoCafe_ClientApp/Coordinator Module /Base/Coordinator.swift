//
//  Coordinator.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//

import Foundation
import UIKit

typealias CoordinatorHandler = () -> ()

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get set }
    var flowCompletionHandler: CoordinatorHandler? { get set }
    
    func start()
}
