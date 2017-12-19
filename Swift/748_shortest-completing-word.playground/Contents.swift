/*
 Find the minimum length word from a given dictionary words, which has all the letters from the string licensePlate. Such a word is said to complete the given string licensePlate
 
 Here, for letters we ignore case. For example, "P" on the licensePlate still matches "p" on the word.
 
 It is guaranteed an answer exists. If there are multiple answers, return the one that occurs first in the array.
 
 The license plate might have the same letter occurring multiple times. For example, given a licensePlate of "PP", the word "pair" does not complete the licensePlate, but the word "supper" does.
 
 Example 1:
 Input: licensePlate = "1s3 PSt", words = ["step", "steps", "stripe", "stepple"]
 Output: "steps"
 Explanation: The smallest length word that contains the letters "S", "P", "S", and "T".
 Note that the answer is not "step", because the letter "s" must occur in the word twice.
 Also note that we ignored case for the purposes of comparing whether a letter exists in the word.
 Example 2:
 Input: licensePlate = "1s3 456", words = ["looks", "pest", "stew", "show"]
 Output: "pest"
 Explanation: There are 3 smallest length words that contains the letters "s".
 We return the one that occurred first.
 Note:
 licensePlate will be a string with length in range [1, 7].
 licensePlate will contain digits, spaces, or letters (uppercase or lowercase).
 words will have a length in the range [10, 1000].
 Every words[i] will consist of lowercase letters, and have length in range [1, 15].
 */

class Solution {
    func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {
        guard let firstWord = words.first else { return "" }
        var winner = firstWord
        var winnerScore = 0
        let targetDict = licensePlate.lowercased().characterCountDictionary // `words` are all lowercase, but not `licensePlate`
        
        // just do it with brute force...
        for w in words {
            var remainingDict = targetDict
            var score = 0
            for c in w {
                if let n = remainingDict[c], n > 0 {
                    remainingDict[c] = n - 1
                    score += 1
                }
            }
            if score > winnerScore || (score == winnerScore && w.count < winner.count) {
                winner = w
                winnerScore = score
            }
        }
        return winner
    }
}

extension String {
    var characterCountDictionary: [Character: Int] {
        var dict: [Character: Int] = [:]
        for c in self {
            if let n = dict[c] {
                dict[c] = n + 1
            } else {
                dict[c] = 1
            }
        }
        return dict
    }
}

// MARK: - Test Cases

let solution = Solution()
guard "steps" == solution.shortestCompletingWord("1s3 PSt", ["step", "steps", "stripe", "stepple"]) else { fatalError() }
guard "pest" == solution.shortestCompletingWord("1s3 456", ["looks", "pest", "stew", "show"]) else { fatalError() }

print("All tests passed")
