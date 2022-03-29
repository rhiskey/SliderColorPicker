//
//  ViewController.swift
//  SliderColorPicker
//
//  Created by Владимир Киселев on 18.03.2022.
//

import UIKit


class SettingsViewController: UIViewController {
    
    @IBOutlet var colorWindowView: UIView!
    
    @IBOutlet var redScrollLabel: UILabel!
    @IBOutlet var greenScrollLabel: UILabel!
    @IBOutlet var blueScrollLabel: UILabel!
    
    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    var mainScreenColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        redColorSlider.delegate = self
        //        greenColorSlider.delegate = self
        //        blueColorSlider.delegate = self
        
        colorWindowView.backgroundColor = mainScreenColor
        colorWindowView.layer.cornerRadius = 16
        setValue(for: greenScrollLabel, greenScrollLabel, blueScrollLabel)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redScrollLabel.text = string(from: redColorSlider)
        case greenColorSlider:
            greenScrollLabel.text = string(from: greenColorSlider)
        default:
            blueScrollLabel.text = string(from: blueColorSlider)
        }
    }
    
    @IBAction func doneButtonPressed() {
        view.endEditing(true)
        
        let currentScreenColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
        delegate.setNewScreenColor(with: currentScreenColor)
        dismiss(animated: true)
    }
    
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setColor() {
        colorWindowView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redScrollLabel:
                redScrollLabel.text = string(from: redColorSlider)
            case greenScrollLabel:
                greenScrollLabel.text = string(from: greenColorSlider)
            default:
                blueScrollLabel.text = string(from: blueColorSlider)
            }
            
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

//extension SettingsViewController: UITextFieldDelegate {
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        guard let newValue = textField.text else { return }
//        guard let numberValue = Int(newValue) else { return }
//        
////        if textField == minimumValueTF {
////            randomNumber.minimumValue = numberValue
////        } else {
////            randomNumber.maximumValue = numberValue
////        }
//    }
//}

