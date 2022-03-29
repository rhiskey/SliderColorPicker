//
//  StartViewController.swift
//  SliderColorPicker
//
//  Created by Владимир Киселев on 29.03.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewScreenColor(with colorValue: UIColor)
}

class MainViewController: UIViewController {

    private var currentScreenColor = UIColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = currentScreenColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination
        guard let settingsVC = viewController as? SettingsViewController else { return }
        settingsVC.mainScreenColor = currentScreenColor
        settingsVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewScreenColor(with colorValue: UIColor) {
        self.currentScreenColor = colorValue
        view.backgroundColor = colorValue
    }
}

