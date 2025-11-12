//
//  TestWindowHarness.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

@testable import DeeplinksRouting
import UIKit

@MainActor
final class TestWindowHarness {
    let window: UIWindow
    
    init() {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first else {
            fatalError("No UIWindowScene available, Configure Host Application.")
        }
        window = UIWindow(windowScene: scene)
        window.rootViewController = UIViewController()
        window.isHidden = false
    }
    
    func tearDown() {
        window.rootViewController = nil
        window.isHidden = true
    }
}
