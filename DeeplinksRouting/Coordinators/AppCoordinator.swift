//
//  AppCoordinator.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

import UIKit

final class AppCoordinator: Coordinator {
    private let navigationController = UINavigationController()
    private var window: UIWindow?
    private var childCoordinators = [Coordinator]()
    
    init(window: UIWindow?) {
        guard let window else {
            fatalError("Window can't be empty")
        }
        self.window = window
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func start() {
        let homeCoordinator = HomeCoordinator(
            navigationController: navigationController
        )
        childCoordinators.append(homeCoordinator)
        homeCoordinator.start()
    }
}

#if DEBUG
extension AppCoordinator {
    var testHooks: TestHooks {
        TestHooks(target: self)
    }
    
    struct TestHooks {
        private let target: AppCoordinator
        init(target: AppCoordinator) {
            self.target = target
        }
        
        var window: UIWindow? {
            target.window
        }
        
        var viewControllers: [UIViewController] {
            target.navigationController.viewControllers
        }
        
        var childCoordinators: [Coordinator] {
            target.childCoordinators
        }
    }
}
#endif
