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
    
    func getCurrentColor() -> UIColor? {
        UIColor(red: red, green: green, blue: blue, alpha: 1.0)
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
    
    
    private var currentColor: ViewColor = .init(red: 0, green: 0, blue: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorWindowView.layer.cornerRadius = 16
        
    }

    
//MARK: - Slider Actions
    @IBAction func redSliderValueChanged() {
        let sliderValue = round(redColorSlider.value * 100) / 100.0
        
        // TODO: Optimise this, repeat code
        redScrollLabel.text = String(sliderValue)
        currentColor.red = CGFloat(sliderValue)
        colorWindowView.backgroundColor = currentColor.getCurrentColor()
    }
    
    @IBAction func greenSliderValueChanged() {
        let sliderValue = round(greenColorSlider.value * 100) / 100.0
        
        greenScrollLabel.text = String(sliderValue)
        currentColor.green = CGFloat(sliderValue)
        colorWindowView.backgroundColor = currentColor.getCurrentColor()
    }
    
    @IBAction func blueSliderValueChanged() {
        let sliderValue = round(blueColorSlider.value * 100) / 100.0
        
        blueScrollLabel.text = String(sliderValue)
        currentColor.blue = CGFloat(sliderValue)
        colorWindowView.backgroundColor = currentColor.getCurrentColor()
    }
    
}

