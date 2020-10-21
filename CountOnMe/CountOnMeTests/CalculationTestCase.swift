//
//  CalculationTestCase.swift
//  CountOnMeTests
//
//  Created by Fabrice Ortega on 19/10/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculationTestCase: XCTestCase {
    
    // Multiple digits number
    func testWhenTappingThreeFourZero_ThenResultShouldBeThreeHundredFourty(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.tappedNumber(numberText: "0")
        
        XCTAssert(myCalculation.elements.last == "340")
    }

    // Simple addition 4+3=7
    func testWhenDoingAdditionFourPlusThree_ThenResultShouldBeSeven(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.addition()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "7")
    }
    
    // Simple substraction 12-5=7
    func testWhenTwelveMinusFive_ThenResultShouldBeSeven(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "12")
        myCalculation.substraction()
        myCalculation.tappedNumber(numberText: "5")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "7")
    }
    
    // Simple multiplication 8x3=24
    func testWhenEightPerThree_ThenResultShouldBeTwentyFour(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "8")
        myCalculation.multiplication()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "24")
    }
    
    // Divivion with integer result 8/2=4
    func testWhenEightDividedByTwo_ThenResultShouldBeFour(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "8")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "4")
    }
    
    // Divivion with decimal result 7/2=3.5
    func testWhenSevenDividedByTwo_ThenResultShouldBeThreePointFive(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "7")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "3.5")
    }
    
    // Add, sub, multi and divi in same calculation 8+2x4-3/2=14.5
    func testWhenEightPlusTwoPerFourMinusThreeDividedByTwo_ThenResultShouldBeFourteenPointFive(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "8")
        myCalculation.addition()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.multiplication()
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.substraction()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "14.5")
    }
    
    // Check priority when multiple multi or divi in a row 6-4x3/2=0
    func testWhenSixMinusFourPerThreeDividedByTwo_ThenResultShouldBeZero(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "6")
        myCalculation.substraction()
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.multiplication()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "0")
    }
    
    // Check priority to the division 2-3x3/3x4/2=-4
    func testWhenTwoMinusThreeperThreeOnThreePerFourOnTwo_ThenResultShouldBeMinusFour(){
        let myCalculation = Calculation()
        
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.substraction()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.multiplication()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.multiplication()
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.division()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.result()
        
        XCTAssert(myCalculation.elements.last == "-4")
    }
    
    // Check the reintialisation of the calculation if operand tapped after a calculation
    func testGivenResultIsFive_WhenPlusButtonTapped_ThenCalculationShouldBeEmpty(){
        let myCalculation = Calculation()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.addition()
        myCalculation.tappedNumber(numberText: "3")
        myCalculation.result()
        
        myCalculation.addition()
        
        XCTAssert(myCalculation.elements.first == nil)
    }
    
    // Check the reintialisation of the calculation if number tapped after a calculation
    func testGivenResultIsSix_WhenFourTapped_ThenFirstElementShouldBeFour(){
        let myCalculation = Calculation()
        myCalculation.tappedNumber(numberText: "2")
        myCalculation.addition()
        myCalculation.tappedNumber(numberText: "4")
        myCalculation.result()
        
        myCalculation.tappedNumber(numberText: "4")
        
        XCTAssert(myCalculation.elements.first == "4")
    }

}
