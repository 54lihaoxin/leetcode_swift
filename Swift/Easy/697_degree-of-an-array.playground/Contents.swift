/*
 
 697. Degree of an Array
 
 Given a non-empty array of non-negative integers nums, the degree of this array is defined as the maximum frequency of any one of its elements.
 
 Your task is to find the smallest possible length of a (contiguous) subarray of nums, that has the same degree as nums.
 
 Example 1:
 Input: [1, 2, 2, 3, 1]
 Output: 2
 Explanation:
 The input array has a degree of 2 because both elements 1 and 2 appear twice.
 Of the subarrays that have the same degree:
 [1, 2, 2, 3, 1], [1, 2, 2, 3], [2, 2, 3, 1], [1, 2, 2], [2, 2, 3], [2, 2]
 The shortest length is 2. So return 2.
 Example 2:
 Input: [1,2,2,3,1,4,2]
 Output: 6
 Note:
 
 nums.length will be between 1 and 50,000.
 nums[i] will be an integer between 0 and 49,999.
 */

class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        
        guard let first = nums.first else { return 0 }
        var maxDegree = 1
        var nVsDegree: [Int: Int] = [:]
        var nVsFirstIndex: [Int: Int] = [:]
        var nVsLastIndex: [Int: Int] = [:]
        
        // gather info
        for (i, n) in nums.enumerated() {
            if let degree = nVsDegree[n] {
                maxDegree = max(maxDegree, degree + 1)
                nVsDegree[n] = degree + 1
                nVsLastIndex[n] = i
            } else {    // new number
                nVsDegree[n] = 1
                nVsFirstIndex[n] = i
                nVsLastIndex[n] = i
            }
        }
        
        // produce result
        var firstIndex = 0
        var lastIndex = Int.max
        var result = Int.max
        for (n, d) in nVsDegree {
            if d == maxDegree, let first = nVsFirstIndex[n], let last = nVsLastIndex[n] {
                result = min(result, last - first + 1)
            }
        }
        
        return result
    }
}

let solution = Solution()
guard 2 == solution.findShortestSubArray([1, 2, 2, 3, 1]) else { fatalError() }
guard 6 == solution.findShortestSubArray([1, 2, 2, 3, 1, 4, 2]) else { fatalError() }

print("All tests passed")

