//
//  FlowCompletion.swift
//  testCoordinatorMiMary
//
//  Created by iPak Tulane on 12/02/24.
//

import Foundation

protocol FlowCompletion {
    associatedtype T
    var completionHandler: ((T) -> ())? { get set }
}
