//
//  ThemeViewController.swift
//  HackerNews
//
//  Created by Nikita Vasilev on 27/03/2020.
//  Copyright © 2020 Nikita Vasilev. All rights reserved.
//

import UIKit

final class ThemeViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet private var tableView: UITableView!

    // MARK: Public Properties
    var output: ThemeViewOutput!
    
    // MARK: Private Properties
    private var theme: Theme?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 11.0, *) {
            navigationItem.largeTitleDisplayMode = .never
        }
        
        view.accessibilityIdentifier = "themeView"
        
        tableView.isAccessibilityElement = true
        tableView.accessibilityIdentifier = "themesTableView"
        
        tableView.register(ThemeSelectableTableViewCell.self)
        tableView.tableFooterView = UIView()
        output.viewIsReady()
    }
}

// MARK: ThemeViewInput
extension ThemeViewController: ThemeViewInput {
    func setupInitialState(title: String, theme: Theme) {
        self.title = title
        self.theme = theme
        update(theme: theme)
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func update(theme: Theme) {
        self.theme = theme
        theme.tableView.apply(to: tableView)
        theme.view.apply(to: view)
    }
}

// MARK: UITableViewDelegate
extension ThemeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        output.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: UITableViewDataSource
extension ThemeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return output.titleForHeader(in: section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return output.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return output.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ThemeSelectableTableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let model = output.getModel(for: indexPath)
        cell.title = model.title
        cell.accessoryType = model.isSelected ? .checkmark : .none
        cell.isAccessibilityElement = true
        cell.accessibilityIdentifier = String(format: "themeCell_%d_%d", indexPath.section, indexPath.row)

        if let theme = theme {
            cell.apply(theme: theme)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Metric.cellHeight
    }
}

// MARK: Constants
extension ThemeViewController {
    private enum Metric {
       static let cellHeight: CGFloat = 48.0
    }
}
