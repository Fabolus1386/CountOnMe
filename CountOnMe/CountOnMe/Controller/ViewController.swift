//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
    //Instance of Calculation
    var myCalculation = Calculation()
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Method to attribute the text view
    func attributeText () {
        textView.text = myCalculation.calculationText
    }
    
    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        myCalculation.tappedNumber(numberText: numberText)
        
        //refresh the text by calling below method
        attributeText()
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if myCalculation.canAddOperator {
            myCalculation.addition()
            
            //Refresh the text by calling below method
            attributeText()
        } else {
            alert(title: "Zéro !", message: "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if myCalculation.canAddOperator {
            myCalculation.substraction()
            
            //Refresh the text by calling below method
            attributeText()
        } else {
            alert(title: "Zéro !", message: "Un operateur est déja mis !")
        }
    }
    
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if myCalculation.canAddOperator {
            myCalculation.multiplication()
            
            //Refresh the text by calling below method
            attributeText()
        } else {
            alert(title: "Zéro !", message: "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if myCalculation.canAddOperator {
            myCalculation.division()
            
            //Refresh the text by calling below method
            attributeText()
        } else {
            alert(title: "Zéro !", message: "Un operateur est déja mis !")
        }
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard myCalculation.expressionIsCorrect else {
            alert(title: "Zéro !", message: "Entrez une expression correcte !")
            return
        }
        
        guard myCalculation.expressionHaveEnoughElement else {
            alert(title: "Zéro !", message: "Démarrez un nouveau calcul !")
            return
        }
        
        // Call the result method
        myCalculation.result()
        
        //Refresh the text by calling below method
        attributeText()
    }
    
    // Method to call an alert
    func alert(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        return self.present(alertVC, animated: true, completion: nil)
    }

}

