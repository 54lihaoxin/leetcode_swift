//
//  Challenge_949.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 949. Largest Time for Given Digits
 
 Given an array of 4 digits, return the largest 24 hour time that can be made.
 
 The smallest 24 hour time is 00:00, and the largest is 23:59.  Starting from 00:00, a time is larger if more time has elapsed since midnight.
 
 Return the answer as a string of length 5.  If no valid time can be made, return an empty string.
 
 
 
 Example 1:
 
 Input: [1,2,3,4]
 Output: "23:41"
 Example 2:
 
 Input: [5,5,5,5]
 Output: ""
 
 
 Note:
 
 A.length == 4
 0 <= A[i] <= 9
 
 */

import Foundation

enum Challenge_949: Challenge {
    
    static let name = "Challenge 949"
    
    static func runTests() {
        let solution = Solution()
        guard "" == solution.largestTimeFromDigits([5, 5, 5, 5]) else { fatalError() }
        guard "23:41" == solution.largestTimeFromDigits([1, 2, 3, 4]) else { fatalError() }
        guard "04:00" == solution.largestTimeFromDigits([0, 4, 0, 0]) else { fatalError() }
        guard "06:26" == solution.largestTimeFromDigits([2, 0, 6, 6]) else { fatalError() }
        print("All tests passed")
    }
}

fileprivate final class Solution {
    func largestTimeFromDigits(_ A: [Int]) -> String {
        
        // brute force it since the scope is small
        
        let indexes = [0, 1, 2, 3]
        var remainingIndexes = Set(indexes)
        var largestLegalNumber = -1
        var result = ""
        
        for a in indexes where A[a] <= 2 {
            remainingIndexes.remove(a)
            for b in remainingIndexes where A[a] == 2 ? A[b] <= 3 : true {
                remainingIndexes.remove(b)
                for c in remainingIndexes where A[c] <= 5 {
                    remainingIndexes.remove(c)
                    for d in remainingIndexes {
                        let n = A[a] * 1000 + A[b] * 100 + A[c] * 10 + A[d]
                        if largestLegalNumber < n {
                            largestLegalNumber = n
                            result = "\(A[a])\(A[b]):\(A[c])\(A[d])"
                        }
                    }
                    remainingIndexes.insert(c)
                }
                remainingIndexes.insert(b)
            }
            remainingIndexes.insert(a)
        }
        
        return result
    }
}
