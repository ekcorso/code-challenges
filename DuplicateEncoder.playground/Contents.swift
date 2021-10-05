// Duplicate Encoder Challenge from CodeWars
// https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/swift

import UIKit

func duplicateEncode(_ word: String) -> String {
    var result = ""
    var duplicateLetters: [String] {
        let wordAsSet = Set(word.lowercased())
        var duplicates = word.lowercased().map( {String($0)} )
        
        for letter in wordAsSet {
            duplicates.remove(at: duplicates.firstIndex(of: String(letter))!)
        }
        return duplicates
    }
    
    for letter in word.lowercased() {
        if duplicateLetters.contains(String(letter)) {
            result.append(")")
        } else {
            result.append("(")
        }

    }
    return result
}

duplicateEncode("Success")


