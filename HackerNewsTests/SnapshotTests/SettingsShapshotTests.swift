//
//  SettingsShapshotTests.swift
//  HackerNewsUITests
//
//  Created by Никита Васильев on 10.06.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import FBSnapshotTestCase
    
@testable import HackerNews

final class SettingsShapshotTests: FBSnapshotTestCase {
    
    var settingsViewController: SettingsViewController!
    var presenter: SettingsPresenter!
    var themeManager: ThemeManagerProtocol!
    
    override func setUp() {
        super.setUp()
        
        recordMode = false//ProcessInfo.processInfo.environment["RECORD_MODE"] == "true"
        
        fileNameOptions = [
            FBSnapshotTestCaseFileNameIncludeOption.OS,
            FBSnapshotTestCaseFileNameIncludeOption.screenScale
        ]
        
        settingsViewController = MockContainer().container.resolve(SettingsViewController.self)
        presenter = MockContainer().container.resolve(SettingsPresenter.self, argument: settingsViewController!)
        themeManager = MockContainer().container.resolve(ThemeManager.self)
    }
    
    func testThatViewControllerDisplayLightTheme() {
        let os = UIDevice.current.systemVersion
        let scale = UIScreen.main.scale

        themeManager.theme = .light
        
        FBSnapshotVerifyView(settingsViewController.view, identifier: "\(os)_\(scale)", perPixelTolerance: 0.05)
    }
    
    func testThatViewControllerDisplayDarkTheme() {
        let os = UIDevice.current.systemVersion
        let scale = UIScreen.main.scale
        
        themeManager.theme = .dark

        FBSnapshotVerifyView(settingsViewController.view, identifier: "\(os)_\(scale)", perPixelTolerance: 0.05)
    }
}
