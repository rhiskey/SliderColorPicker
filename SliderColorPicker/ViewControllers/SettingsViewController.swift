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
        
        colorWindowView.backgroundColor = mainScreenColor
        
        colorWindowView.layer.cornerRadius = 16
        
        redColorSlider.tintColor = .red
        greenColorSlider.tintColor = .green
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        setSliders()
        setValue(for: redTF, greenTF, blueTF)
        setValue(for: greenScrollLabel, greenScrollLabel, blueScrollLabel)
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        switch sender {
        case redColorSlider:
            setValue(for: redScrollLabel)
            setValue(for: redTF)
        case greenColorSlider:
            setValue(for: greenScrollLabel)
            setValue(for: greenTF)
        default:
            setValue(for: blueScrollLabel)
            setValue(for: blueTF)
        }
        
        setColor()
    }
    
    
    @IBAction func doneButtonPressed() {
//        view.endEditing(true)
        delegate.setNewScreenColor(colorWindowView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
}

// MARK: - UITextFieldDelegate
extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {

        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField {
            case redTF:
                redColorSlider.setValue(currentValue, animated: true)
                setValue(for: redScrollLabel)
            case greenTF:
                greenColorSlider.setValue(currentValue, animated: true)
                setValue(for: greenScrollLabel)
            default:
                blueColorSlider.setValue(currentValue, animated: true)
                setValue(for: blueScrollLabel)
            }
            setColor()
            return
        }
        
        showAlert(title: "Error!", message: "Wrong input range")
        textField.text = "0.0"
    }
    
    // Before show edit
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneBI = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(doneButtonPressed)
        )
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexibleSpace, doneBI]
    }
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setSliders() {
        let ciColor = CIColor(color: mainScreenColor)
        redColorSlider.value = Float(ciColor.red)
        greenColorSlider.value = Float(ciColor.green)
        blueColorSlider.value = Float(ciColor.blue)

    }
    
    private func setInitialValues(forLabels labels: UILabel..., forSliders sliders: UISlider..., forTextFields textFields: UITextField...) {
        let ciColor = CIColor(color: mainScreenColor)
        
        labels.forEach { label in
            switch label {
            case redScrollLabel:
                redScrollLabel.text = "\(ciColor.red)"
            case greenScrollLabel:
                greenScrollLabel.text = "\(ciColor.green)"
            default:
                blueScrollLabel.text = "\(ciColor.blue)"
            }
        }
    }
    
    private func setColor() {
        colorWindowView.backgroundColor = UIColor(
            red: CGFloat(redColorSlider.value),
            green: CGFloat(greenColorSlider.value),
            blue: CGFloat(blueColorSlider.value),
            alpha: 1
        )
    }
    
    private func setValue(for fields: UITextField...) {
        fields.forEach { field in
            switch field {
            case redTF:
                redTF.text = string(from: redColorSlider)
            case greenTF:
                greenTF.text = string(from: greenColorSlider)
            default:
                blueTF.text = string(from: blueColorSlider)
            }
        }
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
    
    // MARK: - Alert
    private func showAlert(title: String, message massage: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
