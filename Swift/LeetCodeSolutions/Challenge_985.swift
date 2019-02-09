//
//  Challenge_985.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 985. Sum of Even Numbers After Queries
 
 We have an array A of integers, and an array queries of queries.
 
 For the i-th query val = queries[i][0], index = queries[i][1], we add val to A[index].  Then, the answer to the i-th query is the sum of the even values of A.
 
 (Here, the given index = queries[i][1] is a 0-based index, and each query permanently modifies the array A.)
 
 Return the answer to all queries.  Your answer array should have answer[i] as the answer to the i-th query.
 
 
 
 Example 1:
 
 Input: A = [1,2,3,4], queries = [[1,0],[-3,1],[-4,0],[2,3]]
 Output: [8,6,2,4]
 Explanation:
 At the beginning, the array is [1,2,3,4].
 After adding 1 to A[0], the array is [2,2,3,4], and the sum of even values is 2 + 2 + 4 = 8.
 After adding -3 to A[1], the array is [2,-1,3,4], and the sum of even values is 2 + 4 = 6.
 After adding -4 to A[0], the array is [-2,-1,3,4], and the sum of even values is -2 + 4 = 2.
 After adding 2 to A[3], the array is [-2,-1,3,6], and the sum of even values is -2 + 6 = 4.
 
 
 Note:
 
 1 <= A.length <= 10000
 -10000 <= A[i] <= 10000
 1 <= queries.length <= 10000
 -10000 <= queries[i][0] <= 10000
 0 <= queries[i][1] < A.length
 
 */

import Foundation

enum Challenge {
    
    static let name = "Challenge 985"
    
    static func run() {
        let solution = Solution()
        guard [8,6,2,4] == solution.sumEvenAfterQueries([1,2,3,4], [[1,0],[-3,1],[-4,0],[2,3]]) else { fatalError() }
        print("All tests passed")
    }
}

final class Solution {
    func sumEvenAfterQueries(_ A: [Int], _ queries: [[Int]]) -> [Int] {
        var state = A
        var sum = state.reduce(0) {
            $0 + ($1.isEvent ? $1 : 0)
        }
        var result = [Int]()
        
        for q in queries {
            let prevVal = state[q[1]]
            state[q[1]] += q[0]
            if prevVal.isEvent {
                sum -= prevVal
            }
            if state[q[1]].isEvent {
                sum += state[q[1]]
            }
            result.append(sum)
        }
        
        return result
    }
}

extension Int {
    var isEvent: Bool {
        return self % 2 == 0
    }
}
