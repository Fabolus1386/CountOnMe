//
//  Calculation.swift
//  CountOnMe
//
//  Created by Fabrice Ortega on 16/10/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Calculation {
    
    // Parameter to store the text of the calculation
    var calculationText: String = ""
    
    // Array of selected elements
    var elements: [String] {
        return calculationText.split(separator: " ").map { "\($0)" }
    }
    
    // Error check computed variables
    var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/"
    }
    
    // Check if an operation has been demanded
    var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }
    
    // Check if operator can be added
    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "x" && elements.last != "/" && elements.first != nil
    }
    
    //
    var expressionHaveResult: Bool {
        return calculationText.firstIndex(of: "=") != nil
    }
    
    
    //Method for tapped number
    func tappedNumber(numberText: String) {
        if expressionHaveResult {
            calculationText = ""
        }
        
        calculationText.append(numberText)
    }
    
    //Method for addition
    func addition() {
        calculationText.append(" + ")
        
        // Reset calculation if result already received
        if expressionHaveResult {
            calculationText = ""
        }
    }
    
    
    //Method for substraction
    func substraction() {
        calculationText.append(" - ")
        
        // Reset calculation if result already received
        if expressionHaveResult {
            calculationText = ""
        }
    }
    
    //Method for multiplication
    func multiplication() {
        calculationText.append(" x ")
        
        // Reset calculation if result already received
        if expressionHaveResult {
            calculationText = ""
        }
    }
    
    //Method for division
    func division() {
        calculationText.append(" / ")
        
        // Reset calculation if result already received
        if expressionHaveResult {
            calculationText = ""
        }
    }
    
    //Method for result
    func result() {
        // Create local copy of operations for result method
        var operationsToReduce = elements
        
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            
            // Priority to multiplication and division
            while operationsToReduce.contains("x") || operationsToReduce.contains("/") {
                for i in 0...(operationsToReduce.count-1) {
                    
                    // Make sure i is still in the range
                    if i > 1 && i <= operationsToReduce.count-1 {
                        
                        // Find the multiplication and divisions
                        if operationsToReduce[i-1] == "x" || operationsToReduce[i-1] == "/" {
                            
                            // Assign the numbers and operand of the local operation
                            let left = Double(operationsToReduce[i-2])!
                            let operand = operationsToReduce[i-1]
                            let right = Double(operationsToReduce[i])!
                            
                            //Make the local operation
                            var result: Double
                            switch operand {
                            case "x": result = left * right
                            case "/": result = left / right
                            default: fatalError("Unknown operator !")
                            }
                            
                            // Round the result if no decimal needed
                            if result == Double(Int(result)) {
                                let roundResult = Int(result)
                                operationsToReduce.insert("\(roundResult)", at: i+1)
                            } else {
                                operationsToReduce.insert("\(result)", at: i+1)
                            }
                            print(operationsToReduce)
                            
                            operationsToReduce.remove(at: i)
                            operationsToReduce.remove(at: i-1)
                            operationsToReduce.remove(at: i-2)
                            
                            print(operationsToReduce)
                        }
                    }
                }
            }
            
            // Check if addition and substractions are still in the array
            if operationsToReduce.count >= 3 {
                let left = Double(operationsToReduce[0])!
                let operand = operationsToReduce[1]
                let right = Double(operationsToReduce[2])!
                
                var result: Double
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                case "=": return
                default: fatalError("Unknown operator !")
                }
                
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                
                // Round the result if no decimal needed
                if result == Double(Int(result)) {
                    let roundResult = Int(result)
                    operationsToReduce.insert("\(roundResult)", at: 0)
                } else {
                    operationsToReduce.insert("\(result)", at: 0)
                }
            }
        }
        calculationText.append(" = \(operationsToReduce.first!)")
    }
    
}

