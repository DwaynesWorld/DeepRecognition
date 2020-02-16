//
//  ContainerFactory.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Swinject

class ContainerFactory {
    
    public static let standard = ContainerFactory().makeStandard()
    
    private init() {}
    
    private func makeStandard() -> Container {
        let container = Container()
        container.register(AuthenticationServiceProtocol.self) { _ in AuthenticationService() }.inObjectScope(.container)
        container.register(UserServiceProtocol.self) { _ in UserService() }.inObjectScope(.transient)
        container.register(TeamServiceProtocol.self) { _ in TeamService() }.inObjectScope(.transient)
        return container
    }
}
