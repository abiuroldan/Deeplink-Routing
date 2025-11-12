//
//  HomeCoordinator.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

import UIKit

final class HomeCoordinator: Coordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let homeViewController = HomeViewController()
        navigationController
            .pushViewController(homeViewController, animated: false)
    }
}

#if DEBUG
extension HomeCoordinator {
    var testHooks: TestHooks {
        TestHooks(target: self)
    }
    
    struct TestHooks {
        private let target: HomeCoordinator
        init(target: HomeCoordinator) {
            self.target = target
        }
        
        var childControllers: [UIViewController] {
            target.navigationController.viewControllers
        }
    }
}
#endif
