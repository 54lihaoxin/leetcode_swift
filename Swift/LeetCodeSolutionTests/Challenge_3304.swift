//
//  Challenge_3304.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 10/4/24.
//  Copyright © 2024 Haoxin Li. All rights reserved.
//

/*

 3304. Find the K-th Character in String Game I
 Easy
 Topics
 Companies
 Hint
 Alice and Bob are playing a game. Initially, Alice has a string word = "a".

 You are given a positive integer k.

 Now Bob will ask Alice to perform the following operation forever:

 Generate a new string by changing each character in word to its next character in the English alphabet, and append it to the original word.
 For example, performing the operation on "c" generates "cd" and performing the operation on "zb" generates "zbac".

 Return the value of the kth character in word, after enough operations have been done for word to have at least k characters.

 Note that the character 'z' can be changed to 'a' in the operation.

  

 Example 1:

 Input: k = 5

 Output: "b"

 Explanation:

 Initially, word = "a". We need to do the operation three times:

 Generated string is "b", word becomes "ab".
 Generated string is "bc", word becomes "abbc".
 Generated string is "bccd", word becomes "abbcbccd".
 Example 2:

 Input: k = 10

 Output: "c"

  

 Constraints:

 1 <= k <= 500

 */

import XCTest

final class SolutionTests3304: XCTestCase {
    func testSolution() throws {
        // essentially counting the 1's of (k - 1)
        let solution = Solution()
        
        // no op, 0th (0) of "a" is "a"
        XCTAssertEqual("a", solution.kthCharacter(1))
        
        // "a" -> "ab", 1st (1) of "ab" is "b"
        XCTAssertEqual("b", solution.kthCharacter(2))
        
        // "a" -> "abbc", 2nd (10) of "abbc" is "b"
        XCTAssertEqual("b", solution.kthCharacter(3))
        
        // "a" -> "abbc", 3th (11) of "abbc" is "c"
        XCTAssertEqual("c", solution.kthCharacter(4))
        
        // "a" -> "abbcbccd", 4th (100) of "abbcbccd" is "b"
        XCTAssertEqual("b", solution.kthCharacter(5))
        
        // "a" -> "abbcbccd", 5th (101) of "abbcbccd" is "c"
        XCTAssertEqual("c", solution.kthCharacter(6))
        
        // "a" -> "abbcbccd", 6th (110) of "abbcbccd" is "c"
        XCTAssertEqual("c", solution.kthCharacter(7))
        
        // "a" -> "abbcbccd", 7th (111) of "abbcbccd" is "d"
        XCTAssertEqual("d", solution.kthCharacter(8))
        
        print("All tests passed")
    }
}

fileprivate final class Solution {
    // One-liner from https://leetcode.com/problems/find-the-k-th-character-in-string-game-i/solutions/5849967/swift-simple/ :
    //
    //   Character(UnicodeScalar(97 + (k-1).nonzeroBitCount)!)
    //
    func kthCharacter(_ k: Int) -> Character {
        var adjustedK = k - 1
        var numberOf1InAdjustedK = 0
        
        while adjustedK > 0 {
            numberOf1InAdjustedK += adjustedK % 2
            adjustedK /= 2
        }
        
        return numberOf1InAdjustedK.asCharacter
    }
}

fileprivate extension Int {
    var asCharacter: Character {
        switch self % 26 {
        case 0: return "a"
        case 1: return "b"
        case 2: return "c"
        case 3: return "d"
        case 4: return "e"
        case 5: return "f"
        case 6: return "g"
        case 7: return "h"
        case 8: return "i"
        case 9: return "j"
        case 10: return "k"
        case 11: return "l"
        case 12: return "m"
        case 13: return "n"
        case 14: return "o"
        case 15: return "p"
        case 16: return "q"
        case 17: return "r"
        case 18: return "s"
        case 19: return "t"
        case 20: return "u"
        case 21: return "v"
        case 22: return "w"
        case 23: return "x"
        case 24: return "y"
        case 25: return "z"
        default: fatalError()
        }
    }
}
