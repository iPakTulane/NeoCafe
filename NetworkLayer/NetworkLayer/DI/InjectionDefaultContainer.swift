//
//  InjectionDefaultContainer.swift
//  NetworkLayer
//
//  Created by iPak Tulane on 15/03/24.
//

import Factory

typealias InjectionDefaultContainer = Container
typealias InjectionFactory = Factory
typealias InjectionInjected = Injected

extension InjectionDefaultContainer {
    
    var networkService: InjectionFactory<NetworkServiceProtocol> {
        self { NetworkService() }
    }
}
