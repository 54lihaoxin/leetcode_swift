//
//  Challenge_2423.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 10/6/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 2423. Remove Letter To Equalize Frequency
 Easy
 Topics
 Companies
 Hint
 You are given a 0-indexed string word, consisting of lowercase English letters. You need to select one index and remove the letter at that index from word so that the frequency of every letter present in word is equal.

 Return true if it is possible to remove one letter so that the frequency of all letters in word are equal, and false otherwise.

 Note:

 The frequency of a letter x is the number of times it occurs in the string.
 You must remove exactly one letter and cannot choose to do nothing.


 Example 1:

 Input: word = "abcc"
 Output: true
 Explanation: Select index 3 and delete it: word becomes "abc" and each character has a frequency of 1.
 Example 2:

 Input: word = "aazz"
 Output: false
 Explanation: We must delete a character, so either the frequency of "a" is 1 and the frequency of "z" is 2, or vice versa. It is impossible to make all present letters have equal frequency.


 Constraints:

 2 <= word.length <= 100
 word consists of lowercase English letters only.

 */

import Foundation

enum Challenge_2423: Challenge {

    static let name = "Challenge 3304"

    static func runTests() {
        let solution = Solution()
        guard solution.equalFrequency("abcc") else { fatalError() }
        guard !solution.equalFrequency("aazz") else { fatalError() }
        guard solution.equalFrequency("bac") else { fatalError() }
        guard solution.equalFrequency("aca") else { fatalError() }
        guard !solution.equalFrequency("ddaccb") else { fatalError() }
        guard solution.equalFrequency("cccaa") else { fatalError() }
        guard solution.equalFrequency("abbcc") else { fatalError() }
        guard solution.equalFrequency("zz") else { fatalError() }
        guard solution.equalFrequency("cccd") else { fatalError() }
        guard !solution.equalFrequency("cbccca") else { fatalError() }
        guard !solution.equalFrequency("ceeeec") else { fatalError() }
    }
}

fileprivate final class Solution {
    func equalFrequency(_ word: String) -> Bool {
        var letterCount: [Character: Int] = [:]
        for letter in word {
            letterCount[letter, default: 0] += 1
        }

        guard letterCount.count > 1 else { return true } // same character for the whole word

        var frequencyCount: [Int: Int] = [:]
        for frequency in letterCount.values {
            frequencyCount[frequency, default: 0] += 1
        }
        let frequencyKeys = frequencyCount.keys.sorted(by: <)

        let result = (
            // all letters has frequency of 1 - any of them can be removed and still return true
            frequencyCount.count == 1 &&
            frequencyKeys[0] == 1
        ) || (
            // two frequencies:
            //   a. if the least frequent count is 1, and the frequenct is 1, simply remove it returns true
            //   b. if the most frequent count is 1, the frequency can be only 1 larger than the other one
            frequencyCount.count == 2 && (
                (
                    frequencyCount[frequencyKeys[0]] == 1 &&
                    frequencyKeys[0] == 1
                ) || (
                    frequencyCount[frequencyKeys[1]] == 1 &&
                    frequencyKeys[0] + 1 == frequencyKeys[1]
                )
            )
        )

        return result
    }
}
