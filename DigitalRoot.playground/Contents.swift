// Sum of Digits/ Digital Root challenge from Codewars
// https://www.codewars.com/kata/541c8630095125aba6000c00/train/swift

// This function takes a number and sums it digits recursively until it is a single digit number and then returns that value

import UIKit

// Alt clever method of counting the digits, but it doesn't fit with this solution
//var testNum = 213
//let digits: Int = Int(floor(log10(Double(testNum))) + 1)

func digitalRoot(of number: Int) -> Int {
    var currentNum = number
    var digitsArray: [Int] {
        return String(describing: currentNum).compactMap { Int(String($0)) }
    }
    
    repeat {
        currentNum = digitsArray.reduce(0, +)
    } while digitsArray.count > 1
    
    return currentNum
}

