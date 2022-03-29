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
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    
    var mainScreenColor: UIColor!
    var delegate: SettingsViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        setInitialValues()
        
        colorWindowView.backgroundColor = mainScreenColor
        colorWindowView.layer.cornerRadius = 16
        
        setValue(for: greenScrollLabel, greenScrollLabel, blueScrollLabel)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redColorSlider:
            redScrollLabel.text = string(from: redColorSlider)
            redTF.text = string(from: redColorSlider)
        case greenColorSlider:
            greenScrollLabel.text = string(from: greenColorSlider)
            greenTF.text = string(from: greenColorSlider)
        default:
            blueScrollLabel.text = string(from: blueColorSlider)
            blueTF.text = string(from: blueColorSlider)
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
extension SettingsViewController: UITextFieldDelegate{
    private func setInitialValues() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        mainScreenColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        redScrollLabel.text = "\(red)"
        greenScrollLabel.text = "\(green)"
        blueScrollLabel.text = "\(blue)"
        
        redColorSlider.value = Float(red)
        greenColorSlider.value = Float(green)
        blueColorSlider.value = Float(blue)
        
        redTF.text = "\(red)"
        greenTF.text = "\(green)"
        blueTF.text = "\(blue)"
    }
    
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
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        
        setColor()
        if textField == redTF {
            redColorSlider.value = numberValue
        } else if textField == greenTF {
            greenColorSlider.value = numberValue
        } else {
            blueColorSlider.value = numberValue
        }
        
        setValue(for: greenScrollLabel, greenScrollLabel, blueScrollLabel)
        
    }
}


