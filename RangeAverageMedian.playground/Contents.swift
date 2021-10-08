// from Codewars challenge "Stats for an Athletic Association"
// https://www.codewars.com/kata/55b3425df71c1201a800009c/train/swift

import UIKit

// This func should take a string in the format "hh|mm|ss, hh|mm|ss, hh|mm|ss, hh|mm|ss, hh|mm|ss" containing the race results of a an arbitrarily-sized team of runners. This func should calculate the range, mean, and median and return those values in the format "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"
// If the imput string is empty, return ""
// If the result in seconds is ab.xy it should be truncated as ab

//Could refactor this later to use classes instead of primitive types


func stat(_ strg: String) -> String {
    // Step 1: Break the string into individual scores by ","
    // Step 2: Break the individual scores by "|" and convert to seconds
    // Step 3: Calculate range, mean, and median (in seconds)
    // Step 4: Re-format the data and return as a string
    var scoresInSeconds: [Int] {
        let scores = strg.components(separatedBy: ", ")
        var arrayOfScoresInSeconds = [Int]()
        for score in scores {
            let indScoreString = score.components(separatedBy: "|").map( {Int($0)} )
            let indScoreInt = (indScoreString[0]! * 3600) + (indScoreString[1]! * 60) + indScoreString[2]!
            arrayOfScoresInSeconds.append(indScoreInt)
        }
        return arrayOfScoresInSeconds
    }
    
    let range: Int = scoresInSeconds.max()! - scoresInSeconds.min()!
    let average: Int = scoresInSeconds.reduce(0, +)
    var median: Int {
        let length = scoresInSeconds.count
        if length % 2 == 0 {
            return ((scoresInSeconds[length / 2 - 1] + scoresInSeconds[length / 2]) / 2 )
        } else {
            return ((scoresInSeconds[length / 2]))
        }
    }
        
    return "Range: \(range) Average: \(average) Median: \(median)"
}

let sampleStats = "01|15|59, 1|47|6, 01|17|20, 1|32|34, 2|3|17"
print(stat(sampleStats))


