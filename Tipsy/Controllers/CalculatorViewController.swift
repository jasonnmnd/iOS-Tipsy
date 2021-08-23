//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var numberOfPeople = 2
    var amountTotal = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let tipPctString = String(sender.currentTitle!.dropLast())
        let tipPctDouble = Double(tipPctString)!
    
        tip = tipPctDouble / 100
        print(tip)
        
        billTextField.endEditing(true)
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        print("Total amount of bill: ", billTextField.text!)
        print("Tip amount: ", tip)
        print("Number of People: ",numberOfPeople)
        
        let amountEachPersonPays = String(format: "%.2f", (((Double(billTextField.text!) ?? 0) + ((Double(billTextField.text!) ?? 0) * tip))) / Double(numberOfPeople))
        
        print(amountEachPersonPays)
        amountTotal = amountEachPersonPays
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToResult") {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalAmount = amountTotal
            destinationVC.numPeople = numberOfPeople
            destinationVC.tipAmount = tip
            
        }
    }

}

