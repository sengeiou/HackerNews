//
//  ThemeManager.swift
//  HackerNews
//
//  Created by Никита Васильев on 05.04.2020.
//  Copyright © 2020 Никита Васильев. All rights reserved.
//

import UIKit

protocol ThemeManagerProtocol: AnyObject {
    var theme: Theme { get set }
    var themes: [Theme] { get }
    
    func addObserver(_ observer: ThemeObserver)
    func removeObserver(_ observer: ThemeObserver)
}

final class ThemeManager: ThemeManagerProtocol {
    
    // MARK: Public Properties
    
    /// Returns the shared theme manager object.
    static let shared = ThemeManager()
    
    /// A `Theme` value that contains the current application theme.
    var theme: Theme = Theme(rawValue: SettingsManager.shared.currentTheme ?? "") ?? .dark {
        didSet {
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let `self` = self else { return }
                
                for observer in self.observers.allObjects {
                    guard let weakObserver = observer as? ThemeObserver else { return }
                    weakObserver.themeDidChange(self.theme)
                }
            }
            SettingsManager.shared.currentTheme = theme.rawValue
        }
    }
    
    /// All application themes.
    let themes: [Theme] = [.light, .dark]
    
    /// Contains observers.
    private(set) var observers = WeakObjectSet<AnyObject>()
    
    // MARK: Intialization
    private init() { }
    
    // MARK: Public Methods
    
    /// Add observer to theme manager.
    ///
    /// - Parameter observer: A `ThemeObserver` value that contains the object that will receive notification that theme was changed.
    func addObserver(_ observer: ThemeObserver) {
        guard !observers.contains(observer as AnyObject) else {
            return
        }
        
        observers.append(observer as AnyObject)
    }
    
    /// Remove observer from manager.
    ///
    /// - Parameter observer: The object to be delete.
    func removeObserver(_ observer: ThemeObserver) {
        observers.remove(observer as AnyObject)
    }
}
