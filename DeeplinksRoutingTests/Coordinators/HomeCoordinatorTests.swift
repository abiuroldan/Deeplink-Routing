//
//  HomeCoordinatorTests.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

@testable import DeeplinksRouting
import XCTest

@MainActor
final class HomeCoordinatorTests: XCTestCase {
    private var appCordinatorMock: AppCoordinatorMock!
    private var homeCoordinator: HomeCoordinator!
    
    override func setUp() {
        appCordinatorMock = AppCoordinatorMock()
        homeCoordinator = HomeCoordinator(navigationController: appCordinatorMock.navController())
    }
    
    override func tearDown() {
        appCordinatorMock = nil
        homeCoordinator = nil
    }
    
    func testNotStartHomeCoordinator() {
        XCTAssertTrue(homeCoordinator.testHooks.childControllers.isEmpty)
    }
    
    func testStartingHomeCoordinator() {
        homeCoordinator.start()
        
        XCTAssertFalse(homeCoordinator.testHooks.childControllers.isEmpty)
    }
}
