//
//  Challenge_885.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 8/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

/*
 
 885. Boats to Save People
 
 The i-th person has weight people[i], and each boat can carry a maximum weight of limit.
 
 Each boat carries at most 2 people at the same time, provided the sum of the weight of those people is at most limit.
 
 Return the minimum number of boats to carry every given person.  (It is guaranteed each person can be carried by a boat.)
 
 Example 1:
 
 Input: people = [1,2], limit = 3
 Output: 1
 Explanation: 1 boat (1, 2)
 Example 2:
 
 Input: people = [3,2,2,1], limit = 3
 Output: 3
 Explanation: 3 boats (1, 2), (2) and (3)
 Example 3:
 
 Input: people = [3,5,3,4], limit = 5
 Output: 4
 Explanation: 4 boats (3), (3), (4), (5)
 Note:
 
 1 <= people.length <= 50000
 1 <= people[i] <= limit <= 30000
 
 */

import Foundation

enum Challenge_885: Challenge {
    
    static let name = "Challenge 885"
    
    static func runTests() {
        let solution = Solution()
        guard 1 == solution.numRescueBoats([1,2], 3) else { fatalError() }
        guard 3 == solution.numRescueBoats([3,2,2,1], 3) else { fatalError() }
        guard 4 == solution.numRescueBoats([3,5,3,4], 5) else { fatalError() }
        print("All tests passed")
    }
}

fileprivate final class Solution {
    
    func numRescueBoats(_ people: [Int], _ limit: Int) -> Int {
        let sortedPeople = people.sorted()
        var i = 0
        var j = sortedPeople.count - 1
        var result = 0
        while i <= j {
            result += 1
            if sortedPeople[i] + sortedPeople[j] <= limit {
                i += 1
            }
            j -= 1
        }
        return result
    }
}
