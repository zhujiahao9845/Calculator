//
//  ViewController.swift
//  Auto Layout Calculator
//
//  Created by Jiahao Zhu on 4/30/18.
//  Copyright © 2018 Jiahao Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var number: [UIButton]!
    @IBOutlet var operation: [UIButton]!
    @IBOutlet weak var zero: UIButton!
    @IBOutlet weak var screen: UILabel!
    
    var value = [String]()
    var firstNumber: Double? = nil
    var secondNumber: Double? = nil
    var temp: Double? = 0
    var operatorIndex = 0
    var equalSign = false
    var calculated = false
    var zerosInDecimal = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeItZero()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func calculator(_ sender: UIButton) {
    print(sender.currentTitle!)
        if sender.tag == 19 {
        
            makeItZero()
        
        }
        
        else if sender.tag >= 0 && sender.tag <= 9 {
        
            if calculated == true {
            
                if equalSign == true {
                
                    makeItZero()
                
                }
            
            }
//            else {
//
//                firstNumber = 0
//
//            }
            value == [String(format: "%.8f", Double.pi)] ? (value = []) : ()
            value.append("\(sender.tag)")
            temp = makeItNumber()
            showResult()
            
            print("f1:\(firstNumber ?? 0)", "s1;\(secondNumber ?? 0)", "t1:\(temp ?? 0)", "o:\(operatorIndex)", "c:\(calculated)", "e:\(equalSign)")
        
        }
        
        else if sender.tag == 10 {
        
            value == [String(format: "%.8f", Double.pi)] ? value = [] : ()
            
            value.isEmpty ? value.append("0") : ()
            
            if value.contains(".") == false {
            
                value.append(".")
                temp = makeItNumber()
                showResult()
                screen.text = screen.text! + "."
            
            }
        
        }
        
        else if sender.tag == 11 {
        
            if value == [String(format: "%.8f", Double.pi)] {
                
                return
            
            }
            value = [String(format: "%.8f", Double.pi)]
            temp = makeItNumber()
            showResult()
        
        }
        
        else if screen.text == "Error" {
        
            return
        
        }
        
        else if sender.tag == 17 {
            
            calculated ? (temp = firstNumber! / 100) : (temp = temp! / 100)
            calculated = false
            showResult()
            
        }
        
        else if sender.tag == 18 {
            
            calculated ? (temp = -1 * firstNumber!) : (temp = -1 * temp!)
            calculated = false
            showResult()
            
        }
        
        else {
        
            firstNumber == nil ? (firstNumber = temp) : (secondNumber = temp)
            calculated && sender.tag != 12 ? (secondNumber = nil) : ()
//
            if operatorIndex == 0 && secondNumber != nil {firstNumber = secondNumber; secondNumber = nil}
//
            if secondNumber == nil {
            
                sender.tag == 12 ? () : (operatorIndex = sender.tag)
                value = []
                temp = nil
            
            }
            else {
            
                sender.tag == 12 ? (equalSign = true) : (equalSign = false)
                calculate()
            
            }
            
            print("f2:\(firstNumber ?? 0)", "s2;\(secondNumber ?? 0)", "t2:\(temp ?? 0)", "o:\(operatorIndex)", "c:\(calculated)", "e:\(equalSign)")
        
        }
    
    }
    
    func makeItZero() {
    
        screen.text = "0"
        value = []
        firstNumber = nil
        secondNumber = nil
        temp = 0
        operatorIndex = 0
        zerosInDecimal = 0
        calculated = false
        equalSign = false
    
    }
    
    func makeItNumber() -> Double {
    
        if value.count > 10 {
        
            var ArrSlice = [String]()
            ArrSlice.append(contentsOf: value[0...9])
            value = ArrSlice
        
        }
        
        let number = Double(value.joined(separator: ""))!
        
        if value.contains(".") && value[value.endIndex - 1] == "0" {
        
            for decimal in value[value.index(of: ".")!..<value.count]{
            
                decimal == "0" ? (zerosInDecimal += 1) : ()
            
            }
        
        }
        
        return number
    
    }
    
    func calculate() {
    
        operatorIndex == 13 ? (temp = firstNumber! + secondNumber!) : ()
        
        operatorIndex == 14 ? (temp = firstNumber! - secondNumber!) : ()
        
        operatorIndex == 15 ? (temp = firstNumber! * secondNumber!) : ()
        
        operatorIndex == 16 ? (temp = firstNumber! / secondNumber!) : ()
        
        showResult()
        
        if screen.text != "Error" {
        
            firstNumber = temp
            calculated = true
            if equalSign == true {
            
                temp = secondNumber
                secondNumber = nil
            
            }
            else {
            
                temp = nil
                equalSign = false
            
            }
            value = []
        
        }
    
    }
    
    func showResult() {
    
        var result = "\(temp!)"
        
        if temp! < pow(10, 10) && temp!.truncatingRemainder(dividingBy: 1) == 0 {
        
            result = "\(Int(temp!))"
        
        }
        
        if zerosInDecimal > 0 {
            
            result += "."
        
            for _ in 1...zerosInDecimal {
            
                result += "0"
            
            }
        
        }
        
        if result.count > 10 {
        
            result = String(format: "%e", temp!)
            
            if temp! - Double(result)! == 0 {
        
                while result[result.index(result.endIndex, offsetBy: -5)] == "0" {
                    
                        result.remove(at: result.index(result.endIndex, offsetBy: -5))
                    
                }
            
            }
            
            if result[result.index(result.endIndex, offsetBy: -5)] == "." {
                
                result.remove(at: result.index(result.endIndex, offsetBy: -5))
                
            }
        
        }
        
        screen.text = result
        
        zerosInDecimal = 0
    
    }
    
}

