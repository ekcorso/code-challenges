// from Codewars challenge "Stats for an Athletic Association"
// https://www.codewars.com/kata/55b3425df71c1201a800009c/train/swift

import UIKit

// This func should take a string in the format "hh|mm|ss,hh|mm|ss,hh|mm|ss,hh|mm|ss,hh|mm|ss" containing the race results of a an arbitrarily-sized team of runners. This func should calculate the range, mean, and median and return those values in the format "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"
// If the imput string is empty, return ""
// If the result in seconds is ab.xy it should be truncated as ab

//Could refactor this later to use classes instead of primitive types


func stat(_ strg: String) -> String {
    if strg.isEmpty { return strg }
    
    var scoresInSeconds: [Int] {
        let scores = strg.components(separatedBy: ",")
        var arrayOfScoresInSeconds = [Int]()
        for score in scores {
            let indScoreString = score.components(separatedBy: "|").map( {Int($0)} )
            let indScoreInt = (indScoreString[0]! * 3600) + (indScoreString[1]! * 60) + indScoreString[2]!
            arrayOfScoresInSeconds.append(indScoreInt)
        }
        return arrayOfScoresInSeconds
    }
    
    let rangeInSec: Int = scoresInSeconds.max()! - scoresInSeconds.min()!
    let averageInSec: Int = scoresInSeconds.reduce(0, +) / scoresInSeconds.count
    var medianInSec: Int {
        let length = scoresInSeconds.count
        let sortedScores = scoresInSeconds.sorted()
        return length % 2 == 0 ? ((sortedScores[length / 2 - 1] + sortedScores[length / 2]) / 2 ) : (sortedScores[length / 2])
    }
        
    func formatStat(_ stat: Int) -> String {
        let hours = stat / 3600
        let minutes = (stat - (hours * 3600)) / 60
        let seconds = stat - (hours * 3600) - (minutes * 60)
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 2
        return "\(numberFormatter.string(from: NSNumber(value:hours))!)|\(numberFormatter.string(from: NSNumber(value:minutes))!)|\(numberFormatter.string(from: NSNumber(value:seconds))!)"
    }

    return "Range: \(formatStat(rangeInSec)) Average: \(formatStat(averageInSec)) Median: \(formatStat(medianInSec))"
}

let sampleStats = "02|15|59,02|47|16,02|17|20,02|32|34,02|17|17,02|22|00,02|31|41"
print(stat(sampleStats))


