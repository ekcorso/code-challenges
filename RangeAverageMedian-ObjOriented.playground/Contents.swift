// from Codewars challenge "Stats for an Athletic Association"
// https://www.codewars.com/kata/55b3425df71c1201a800009c/train/swift

import UIKit

// Parameters
// This func should take a string in the format "hh|mm|ss,hh|mm|ss,hh|mm|ss,hh|mm|ss,hh|mm|ss" containing the race results of a an arbitrarily-sized team of runners. This func should calculate the range, mean, and median and return those values in the format "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"
// If the imput string is empty, return ""
// If the result in seconds is ab.xy it should be truncated as ab

//**This version of the solution refactors the original to use classes instead of primitive types and otherwise be more object oriented. The Codewars problem doesn't ask for this, but I thought it was an interesting variation. I also changed the name of the function-- stat(_ strg:) was provided, but I don't think it's very expressive.

struct Score {
    let seconds: Int
    //Is an individual score ever even necessary? If I'm only working in group stats, maybe it's not that important to break this out.
    
    // Each individual score could be initialized with the string (after it's broken into components)
    
}

struct Stats {
    var range: Int
    var average: Int
    var median: Int
    
    init(scores: [Int]) {
        let rangeInSec: Int = scores.max()! - scores.min()!
        let averageInSec: Int = scores.reduce(0, +) / scores.count
        var medianInSec: Int {
            let length = scores.count
            let sortedScores = scores.sorted()
            return length % 2 == 0 ? ((sortedScores[length / 2 - 1] + sortedScores[length / 2]) / 2 ) : (sortedScores[length / 2])
        }
        
        self.range = rangeInSec
        self.average = averageInSec
        self.median = medianInSec
    }
}

func getTeamStats(_ statListStr: String) -> String {
    if statListStr.isEmpty { return statListStr }
    
    var scoresInSeconds: [Int] {
        let scores = statListStr.components(separatedBy: ",")
        var arrayOfScoresInSeconds = [Int]()
        for score in scores {
            let indScoreString = score.components(separatedBy: "|").map( {Int($0)} )
            let indScoreInt = (indScoreString[0]! * 3600) + (indScoreString[1]! * 60) + indScoreString[2]!
            arrayOfScoresInSeconds.append(indScoreInt)
        }
        return arrayOfScoresInSeconds
    }
        
    func formatStat(_ stat: Int) -> String {
        let hours = stat / 3600
        let minutes = (stat - (hours * 3600)) / 60
        let seconds = stat - (hours * 3600) - (minutes * 60)
        let numberFormatter = NumberFormatter()
        numberFormatter.minimumIntegerDigits = 2
        return "\(numberFormatter.string(from: NSNumber(value:hours))!)|\(numberFormatter.string(from: NSNumber(value:minutes))!)|\(numberFormatter.string(from: NSNumber(value:seconds))!)"
    }
    
    let teamStatsInSeconds = Stats(scores: scoresInSeconds)

    return "Range: \(formatStat(teamStatsInSeconds.range)) Average: \(formatStat(teamStatsInSeconds.average)) Median: \(formatStat(teamStatsInSeconds.median))"
}

let sampleStats = "02|15|59,02|47|16,02|17|20,02|32|34,02|17|17,02|22|00,02|31|41"
print(getTeamStats(sampleStats))


