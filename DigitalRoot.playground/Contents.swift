// Sum of Digits/ Digital Root challenge from Codewars
// https://www.codewars.com/kata/541c8630095125aba6000c00/train/swift

import UIKit

// This function takes a number and sums it digits recursively until it is a single digit number and then returns that value

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


// Refactored solution to use recursion instead
func recursiveDigitalRoot(of number: Int) -> Int {
    var digitsArray: [Int] {
        return String(describing: number).compactMap { Int(String($0)) }
    }
        
    if digitsArray.count == 1 { return number }
    
    return recursiveDigitalRoot(of: digitsArray.reduce(0,+))
}

recursiveDigitalRoot(of: 45677)


