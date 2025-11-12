//
//  NiblessViewController.swift
//  DeeplinksRouting
//
//  Created by Abiú Ramírez Roldán on 12/11/25.
//

import UIKit

open class NiblessViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable, message: "Loading this view controller from a nob is unsupported in favor initializer dependency injection.")
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
