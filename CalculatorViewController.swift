import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
        
        var calculatorBrain = CalculatorBrain()
    
    
        var num1 = ""
        var num2 = ""
        var op = ""
    
        // Boolean that store if we add digit to first number or second number
        var isNum1 = true
        var withOp = false
        // This variable will be to store if the last touch was for an operator
        var lastTextIsOp = false
        var clearText = true
        var isNewCalculation = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        @IBAction func operatorClicked(sender: UIButton) {
            
            if clearText {
                result.text = ""
                clearText = false
            }
            
            
            
            
            var currentText = result.text!
            let textLabel = sender.titleLabel?.text
            if let text = textLabel {
                if isNewCalculation {
                        result.text = ""
                        num1 = ""
                        num2 = ""
                        op = ""
                        withOp = false
                        isNum1 = true
                        lastTextIsOp = false
                    isNewCalculation = false
                }
                
                switch text {
                case "+", "x", "÷", "-":
                        
                    if currentText.isEmpty {
                        return
                    }
                    
                        // If we click an operator for the second time
                    if lastTextIsOp {
                        // We clear the op variable, because we will set it right after
                        op = ""
                        // We remove the first operator, because it will be replace by the new one
                        currentText.removeLast()
                    }
                        
                    op = text
                    // When we have an operator, we set isNum1 to false, so we can start forming the second number
                    isNum1 = false
                    withOp = true
                    lastTextIsOp = true
                    result.text = " \(currentText)\(op)"
                    break
                case "=":

                        if !num2.isEmpty {
                        isNewCalculation = true
                        isNum1 = true
                        withOp = false
                        lastTextIsOp = false
                        clearText = true
                        
                    let resultCalc = calculatorBrain.doMath(num1: Int(num1)!, num2: Int(num2)!, op: op)
                    result.text = " \(currentText) \(text) \(resultCalc)"
                        }
                    break
                default:
                    // If we do not have an operator, isnum1 is true, we add digit to first number
                    if isNum1 {
                        num1 = "\(num1)\(text)"
                    } else {
                        num2 = "\(num2)\(text)"
                    }
                    
                    result.text = "\(currentText)\(text)"
                    lastTextIsOp = false
                    break;
                }
            }
        }
        
    
    @IBAction func clear(sender: UIButton) {
        if sender.tag == 11 {
            result.text = ""
            num1 = ""
            num2 = ""
            op = ""
            withOp = false
            isNum1 = true
            lastTextIsOp = false
        }
    }
    
}
