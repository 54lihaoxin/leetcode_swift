//
//  Challenge_976.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 976. Largest Perimeter Triangle
 
 Given an array A of positive lengths, return the largest perimeter of a triangle with non-zero area, formed from 3 of these lengths.
 
 If it is impossible to form any triangle of non-zero area, return 0.
 
 
 
 Example 1:
 
 Input: [2,1,2]
 Output: 5
 Example 2:
 
 Input: [1,2,1]
 Output: 0
 Example 3:
 
 Input: [3,2,3,4]
 Output: 10
 Example 4:
 
 Input: [3,6,2,3]
 Output: 8
 
 
 Note:
 
 3 <= A.length <= 10000
 1 <= A[i] <= 10^6

 
 */

import Foundation

enum Challenge {
    
    static let name = "Challenge 976"
    
    static func run() {
        let solution = Solution()
        guard 0 == solution.largestPerimeter([1,2,3]) else { fatalError() }
        print("All tests passed")
    }
}

final class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        let sortedEdges = A.sorted()
        for (i, edge) in sortedEdges.enumerated().reversed() where i >= 2 {
            if edge < sortedEdges[i - 1] + sortedEdges[i - 2] {
                return edge + sortedEdges[i - 1] + sortedEdges[i - 2]
            }
        }
        return 0
    }
}
