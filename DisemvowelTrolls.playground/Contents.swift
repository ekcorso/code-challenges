// "Disemvowel Trolls" challenge from Codewars

//https://www.codewars.com/kata/52fba66badcd10859f00097e/train/swift

import UIKit

func disemvowel(_ s: String) -> String {
    let vowels = ["a", "e", "i", "o", "u"]
    var returnString = ""
    
    for letter in s {
        if vowels.contains(String(letter.lowercased())) == false {
            returnString.append(letter)
        }
    }
    
    return returnString
}

let testString = "This website is for losers LOL!"

print(disemvowel(testString))
