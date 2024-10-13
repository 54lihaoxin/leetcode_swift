//
//  Challenge_984.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 984. String Without AAA or BBB
 
 Given two integers A and B, return any string S such that:
 
 S has length A + B and contains exactly A 'a' letters, and exactly B 'b' letters;
 The substring 'aaa' does not occur in S;
 The substring 'bbb' does not occur in S.
 
 
 Example 1:
 
 Input: A = 1, B = 2
 Output: "abb"
 Explanation: "abb", "bab" and "bba" are all correct answers.
 Example 2:
 
 Input: A = 4, B = 1
 Output: "aabaa"
 
 
 Note:
 
 0 <= A <= 100
 0 <= B <= 100
 It is guaranteed such an S exists for the given A and B.
 
 */

import XCTest



final class SolutionTests984: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual("bba", solution.strWithout3a3b(1, 2))
    }
}

fileprivate final class Solution {
    func strWithout3a3b(_ A: Int, _ B: Int) -> String {
        let moreChar: String
        let lessChar: String
        let moreCount: Int
        let lessCount: Int
        
        if A >= B {
            moreChar = "a"
            lessChar = "b"
            moreCount = A
            lessCount = B
        } else {
            moreChar = "b"
            lessChar = "a"
            moreCount = B
            lessCount = A
        }
        
        let moreDiff = moreCount - lessCount
        let xxyPairCount = moreCount >= 2 ? min(moreDiff, lessCount) : 0
        let xyPairCount = lessCount - xxyPairCount
        let remainingMoreCount = moreCount - xxyPairCount * 2 - xyPairCount
        
        let xxyString = String(repeating: "\(moreChar)\(moreChar)\(lessChar)", count: xxyPairCount)
        let xyString = String(repeating: "\(moreChar)\(lessChar)", count: xyPairCount)
        let tailingString = String(repeating: moreChar, count: remainingMoreCount)
        
        return [xxyString, xyString, tailingString].joined()
    }
}
