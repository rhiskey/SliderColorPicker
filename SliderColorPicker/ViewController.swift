//
//  ViewController.swift
//  SliderColorPicker
//
//  Created by Владимир Киселев on 18.03.2022.
//

import UIKit

struct ViewColor {
    var red: CGFloat
    var green: CGFloat
    var blue: CGFloat
    
    func getCurrentColor() {
        UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}

class ViewController: UIViewController {

    @IBOutlet var colorWindowView: UIView!
    
    @IBOutlet var redScrollLabel: UILabel!
    @IBOutlet var greenScrollLabel: UILabel!
    @IBOutlet var blueScrollLabel: UILabel!

    @IBOutlet var redColorSlider: UISlider!
    @IBOutlet var greenColorSlider: UISlider!
    @IBOutlet var blueColorSlider: UISlider!
    
    
    //    private let currentColor: ViewColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWindowView.layer.cornerRadius = 16
        
    }

    
//MARK: - Slider Actions
    @IBAction func redSliderValueChanged() {
        let sliderValue = round(redColorSlider.value * 100) / 100.0
        redScrollLabel.text = String(sliderValue)
    }
    
    @IBAction func greenSliderValueChanged() {
        let sliderValue = round(greenColorSlider.value * 100) / 100.0
        greenScrollLabel.text = String(sliderValue)
    }
    
    @IBAction func blueSliderValueChanged() {
        let sliderValue = round(blueColorSlider.value * 100) / 100.0
        blueScrollLabel.text = String(sliderValue)
    }
    
}

