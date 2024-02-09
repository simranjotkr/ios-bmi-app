//
//  ViewController.swift
//  bmicalculator
//
//  Created by Simranjot Kaur on 2024-02-02.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var heightUnit: UILabel!
    @IBOutlet weak var weightUnit: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet var units: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
    }
    @IBOutlet weak var heightErrorLabel: UILabel!
    @IBOutlet weak var weightErrorLabel: UILabel!
    
    @IBOutlet weak var bmiResult: UILabel!
    @IBAction func onUnitChange(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            heightUnit.text = "cm";
            weightUnit.text = "kg";
        } else {
            heightUnit.text = "in";
            weightUnit.text = "lb";
        }
    }
    
    @IBAction func onCalcBMI(_ sender: UIButton) {
        var bmi: Double
        var heightInMeters: Double
        
        heightErrorLabel.text = "";
        weightErrorLabel.text = "";
        
        guard let heightText = heightTextField.text, !heightText.isEmpty,
              let weightText = weightTextField.text, !weightText.isEmpty else {
            if heightTextField.text == "" {
                heightErrorLabel.text = "Height Field Cannot Be Empty.";
            }
            if weightTextField.text == "" {
                weightErrorLabel.text = "Weight Field Cannot Be Empty.";
            }
            return
        }

        guard let height = Double(heightText) else {
            heightErrorLabel.text = "Height Must Be A Number.";
            return;
        }
        
        guard let weight = Double(weightText) else {
            weightErrorLabel.text = "Weight Must Be A Number.";
            return;
        }
        
        if(height < 0) {
            heightErrorLabel.text = "Height Cannot Be Negative.";
        } else if (weight < 0) {
            weightErrorLabel.text = "Weight Cannot Be Negative.";
        } else {
            
            if units.selectedSegmentIndex == 0 {
                heightInMeters = height / 100.0;
                bmi = weight / (heightInMeters * heightInMeters);
            } else {
                let heightInInches = height;
                bmi = (weight / (heightInInches * heightInInches)) * 703;
            }
            
            var bmiCategory: String
            if bmi < 18.5 {
                bmiCategory = "Underweight";
            } else if bmi >= 18.5 && bmi <= 24.9 {
                bmiCategory = "Normal weight";
            } else if bmi >= 25 && bmi <= 29.9 {
                bmiCategory = "Overweight";
            } else {
                bmiCategory = "Obesity";
            }
            
            bmiResult.text = String(format: "%.2f (%@)", bmi, bmiCategory);
        }
    }


    
    
}

