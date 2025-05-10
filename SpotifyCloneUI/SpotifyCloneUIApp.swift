//
//  SwiftfulSwiftUiPracticeApp.swift
//  SwiftfulSwiftUiPractice
//
//  Created by apple on 06/05/25.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftfulSwiftUiPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}


extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
