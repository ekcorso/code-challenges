import UIKit

// Challenge from JK.

// You’ve been hired at Megacorp, a company with tens of thousands of employees worldwide [in the era before everybody brought their personal smartphone to work]. The company wants employees to be able to call each other. But it’s painful to remember people’s phone numbers. It’s easier to remember people’s names. We want employees to call each other by keying in names, not phone numbers. Given a 10-key telephone pad with alphabet letters on each pad [drawn on the whiteboard for reference] and a small screen, a list of employee names and their corresponding phone numbers, how would you build this system?

// Don't need to solve for diacritics, can assume everything is ascii. --Is there a built-in swift library for removing diacritics?

// Not dialing a phone number, just dialing in as much of the employee's name (first + last) as is necessary to disambiguate

struct Keypad {
    // should these be [String] or [Character]?
    let one = ["_", ",", "@"]
    let two = ["a", "b", "c"]
    let three = ["d", "e", "f"]
    let four = ["g", "h", "i"]
    let five = ["j", "k", "l"]
    let six = ["m", "m", "o"]
    let seven = ["p", "q", "r", "s"]
    let eight = ["t", "u", "v"]
    let nine = ["w", "x", "y", "z"]
    let asterisk = ["_"]
    //var zero = [String]()
    
}
