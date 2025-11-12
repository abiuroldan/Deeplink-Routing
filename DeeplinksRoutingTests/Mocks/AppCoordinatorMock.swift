//
//  AppCoordinatorMock.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

import UIKit
@testable import DeeplinksRouting

@MainActor
final class AppCoordinatorMock: Coordinator {
    private let navigationController = UINavigationController()
    private let windowSceneMock = TestWindowHarness()
    private let window: UIWindow?

    init() {
        self.window = windowSceneMock.window
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .blue
        navigationController.pushViewController(
            viewController,
            animated: false
        )
    }
    
    func navController() -> UINavigationController {
        navigationController
    }
}
