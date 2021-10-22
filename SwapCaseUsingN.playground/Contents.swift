// Swap Case Using N challenge from Codewars
// https://www.codewars.com/kata/5f3afc40b24f090028233490/train/swift

import UIKit

func swap(_ s: String, _ n: Int) -> String {
    let binaryInt = String(n, radix: 2)
    var returnString = ""
    var count = 0
    let repeats = 10
    let repeatedBinaryStr = String(String(repeating: binaryInt, count: repeats))
    
    if s.isEmpty { return "" }
    if n == 0 { return s }
    
    for (index, char) in s.enumerated() {
        if char == " " {
            count += 1
            returnString.append(" ")
        } else if char.isLetter == false {
            count += 1
            returnString.append(char)
        } else if repeatedBinaryStr[repeatedBinaryStr.index(s.startIndex, offsetBy: index - count)] == "1" {
            char.isLowercase == true ? returnString.append(char.uppercased()) : returnString.append(char.lowercased())
        } else if repeatedBinaryStr[repeatedBinaryStr.index(s.startIndex, offsetBy: index - count)] == "0" {
            returnString.append(char)
        }
    }
    
    return returnString
}

swap("the quick broWn fox leapt over the fence", 9)

// "The QUicK BrowN foX LeaPT ovER thE FenCE"
