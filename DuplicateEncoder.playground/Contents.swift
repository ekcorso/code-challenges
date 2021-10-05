// Challenge from CodeWars

import UIKit

func duplicateEncode(_ word: String) -> String {
    var result = ""
    let wordAsSet = Set(word)
    var duplicateLetters: String {
        var duplicates = Array(word)
        
        for (index, letter) in word.enumerated() {
            if wordAsSet.contains(letter) {
                duplicates.remove(at: index)
            }
        }
        return String(duplicates)
    }
    
    for letter in word {
        if duplicateLetters.contains(letter) {
            result.append("(")
        } else {
            result.append(")")
        }

    }
    return result
}

duplicateEncode("recede")
