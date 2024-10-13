//
//  Challenge_3304.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 10/6/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 1813. Sentence Similarity III
 Medium
 Topics
 Companies
 Hint
 You are given two strings sentence1 and sentence2, each representing a sentence composed of words. A sentence is a list of words that are separated by a single space with no leading or trailing spaces. Each word consists of only uppercase and lowercase English characters.

 Two sentences s1 and s2 are considered similar if it is possible to insert an arbitrary sentence (possibly empty) inside one of these sentences such that the two sentences become equal. Note that the inserted sentence must be separated from existing words by spaces.

 For example,

 s1 = "Hello Jane" and s2 = "Hello my name is Jane" can be made equal by inserting "my name is" between "Hello" and "Jane" in s1.
 s1 = "Frog cool" and s2 = "Frogs are cool" are not similar, since although there is a sentence "s are" inserted into s1, it is not separated from "Frog" by a space.
 Given two sentences sentence1 and sentence2, return true if sentence1 and sentence2 are similar. Otherwise, return false.



 Example 1:

 Input: sentence1 = "My name is Haley", sentence2 = "My Haley"

 Output: true

 Explanation:

 sentence2 can be turned to sentence1 by inserting "name is" between "My" and "Haley".

 Example 2:

 Input: sentence1 = "of", sentence2 = "A lot of words"

 Output: false

 Explanation:

 No single sentence can be inserted inside one of the sentences to make it equal to the other.

 Example 3:

 Input: sentence1 = "Eating right now", sentence2 = "Eating"

 Output: true

 Explanation:

 sentence2 can be turned to sentence1 by inserting "right now" at the end of the sentence.



 Constraints:

 1 <= sentence1.length, sentence2.length <= 100
 sentence1 and sentence2 consist of lowercase and uppercase English letters and spaces.
 The words in sentence1 and sentence2 are separated by a single space.

 */

import XCTest

final class SolutionTests1813: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertTrue(solution.areSentencesSimilar("My name is Haley", "My Haley"))
        XCTAssertFalse(solution.areSentencesSimilar("of", "A lot of words"))
        XCTAssertTrue(solution.areSentencesSimilar("Eating right now", "Eating"))
        XCTAssertTrue(solution.areSentencesSimilar("a b c", "a b c"))
        XCTAssertTrue(solution.areSentencesSimilar("a", "a aa a"))
        XCTAssertTrue(solution.areSentencesSimilar("A A AAa", "A AAa"))
    }
}

fileprivate final class Solution {
    func areSentencesSimilar(_ sentence1: String, _ sentence2: String) -> Bool {
        guard sentence1 != sentence2 else { return true }
        let array1 = sentence1.components(separatedBy: " ")
        let array2 = sentence2.components(separatedBy: " ")
        let shortSentence = array1.count < array2.count ? array1 : array2
        let longSentence = array1.count < array2.count ? array2 : array1

        // step 1: the left half of short sentence
        var i = 0
        while i < shortSentence.count {
            if shortSentence[i] != longSentence[i] {
                break
            }
            i += 1
        }

        // step 2: the right half of short sentence
        var shortJ = shortSentence.count - 1
        var longJ = longSentence.count - 1
        while i <= shortJ {
            if shortSentence[shortJ] != longSentence[longJ] {
                break
            }
            shortJ -= 1
            longJ -= 1
        }

        return i == shortJ + 1
    }
}
