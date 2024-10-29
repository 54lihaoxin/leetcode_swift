//
//  Challenge_3330.swift
//  LeetCodeSolutionTests
//
//  Created by Haoxin Li on 10/29/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 3330. Find the Original Typed String I
 Easy
 Topics
 Companies
 Hint
 Alice is attempting to type a specific string on her computer. However, she tends to be clumsy and may press a key for too long, resulting in a character being typed multiple times.

 Although Alice tried to focus on her typing, she is aware that she may still have done this at most once.

 You are given a string word, which represents the final output displayed on Alice's screen.

 Return the total number of possible original strings that Alice might have intended to type.



 Example 1:

 Input: word = "abbcccc"

 Output: 5

 Explanation:

 The possible strings are: "abbcccc", "abbccc", "abbcc", "abbc", and "abcccc".

 Example 2:

 Input: word = "abcd"

 Output: 1

 Explanation:

 The only possible string is "abcd".

 Example 3:

 Input: word = "aaaa"

 Output: 4



 Constraints:

 1 <= word.length <= 100
 word consists only of lowercase English letters.

 */

import XCTest

class Challenge_3330: XCTestCase {
    func testSolution() {
        XCTAssertEqual(Solution().possibleStringCount("abbcccc"), 5)
        XCTAssertEqual(Solution().possibleStringCount("abcd"), 1)
        XCTAssertEqual(Solution().possibleStringCount("aaaa"), 4)
    }
}

fileprivate final class Solution {
    func possibleStringCount(_ word: String) -> Int {
        guard !word.isEmpty else { return 1 }
        var resultCount = 1
        var characterRepeatCount = 0
        var prevCharacter: Character?

        for character in word {
            if prevCharacter == character {
                characterRepeatCount += 1
            } else {
                resultCount += characterRepeatCount
                characterRepeatCount = 0
            }
            prevCharacter = character
        }

        // don't forget about the trailing repeating characters
        resultCount += characterRepeatCount

        return resultCount
    }
}
