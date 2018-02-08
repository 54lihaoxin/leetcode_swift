/*
 
 696. Count Binary Substrings
 
 Give a string s, count the number of non-empty (contiguous) substrings that have the same number of 0's and 1's, and all the 0's and all the 1's in these substrings are grouped consecutively.
 
 Substrings that occur multiple times are counted the number of times they occur.
 
 Example 1:
 Input: "00110011"
 Output: 6
 Explanation: There are 6 substrings that have equal number of consecutive 1's and 0's: "0011", "01", "1100", "10", "0011", and "01".
 
 Notice that some of these substrings repeat and are counted the number of times they occur.
 
 Also, "00110011" is not a valid substring because all the 0's (and 1's) are not grouped together.
 Example 2:
 Input: "10101"
 Output: 4
 Explanation: There are 4 substrings: "10", "01", "10", "01" that have equal number of consecutive 1's and 0's.
 Note:
 
 s.length will be between 1 and 50,000.
 s will only consist of "0" or "1" characters.
 */

class Solution {
    func countBinarySubstrings(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }
        var isLastZero = s.first == "0"
        var countZero = isLastZero ? 1 : 0
        var countOne = isLastZero ? 0 : 1
        var totalCount = 0
        for c in s.dropFirst() {
            if c == "0" {
                if isLastZero { // same as last character
                    countZero += 1
                } else { // different character
                    totalCount += min(countZero, countOne)
                    countZero = 1
                }
                isLastZero = true
            } else {    // treat it as "1"
                if !isLastZero { // same as last character
                    countOne += 1
                } else { // different character
                    totalCount += min(countZero, countOne)
                    countOne = 1
                }
                isLastZero = false
            }
        }
        totalCount += min(countZero, countOne)
        return totalCount
    }
}

let solution = Solution()
guard 6 == solution.countBinarySubstrings("00110011") else { fatalError() }
guard 4 == solution.countBinarySubstrings("10101") else { fatalError() }

print("All tests passed")
