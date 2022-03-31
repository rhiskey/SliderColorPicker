//
//  StartViewController.swift
//  SliderColorPicker
//
//  Created by Владимир Киселев on 29.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewScreenColor(_ colorValue: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        guard let settingsVC = viewController as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.mainScreenColor = view.backgroundColor
    }
}

// MARK: - ColorDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setNewScreenColor(_ colorValue: UIColor) {
        view.backgroundColor = colorValue
    }
}

