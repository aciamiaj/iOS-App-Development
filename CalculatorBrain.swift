import Foundation

class CalculatorBrain {

  func doMath(num1: Int, num2: Int, op: String) -> Int {
    var result = 0
    switch op {
    case "+":
      result = num1 + num2
      break
    case "-":
      result = num1 - num2
      break
    case "x":
      result = num1 * num2
      break
    case "÷":
      result = num1 / num2
      break
    default:
      break
    }
    return result
  }
}
