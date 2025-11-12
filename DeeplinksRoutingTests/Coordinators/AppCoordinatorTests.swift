//
//  AppCoordinatorTests.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

@testable import DeeplinksRouting
import XCTest

@MainActor
final class AppCoordinatorTests: XCTestCase {
    var windowSceneMock: TestWindowHarness!
    var appCoordinator: AppCoordinator!
    
    override func setUp() {
        windowSceneMock = TestWindowHarness()
        let hasScene = UIApplication.shared.connectedScenes.contains { $0 is UIWindowScene }
        XCTAssertTrue(hasScene, "No UIWindowScene.")
    }
    
    override func tearDown() {
        appCoordinator = nil
        windowSceneMock?.tearDown()
        windowSceneMock = nil
    }
    
    func testNoStatingAppCoordinator() throws {
        let window = try XCTUnwrap(windowSceneMock?.window)
        appCoordinator = AppCoordinator(window: window)
        
        XCTAssertNotNil(appCoordinator.testHooks.window)
        XCTAssertTrue(appCoordinator.testHooks.viewControllers.isEmpty)
        XCTAssertTrue(appCoordinator.testHooks.childCoordinators.isEmpty)
    }
    
    func testStartingAppCoordinator() {
        let window = windowSceneMock.window
        appCoordinator = AppCoordinator(window: window)
        appCoordinator.start()
        
        XCTAssertNotNil(appCoordinator.testHooks.window)
        XCTAssertFalse(appCoordinator.testHooks.viewControllers.isEmpty)
        XCTAssertEqual(appCoordinator.testHooks.childCoordinators.count, 1)
    }
}
