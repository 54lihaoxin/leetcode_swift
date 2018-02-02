/*
 You're given strings J representing the types of stones that are jewels, and S representing the stones you have.  Each character in S is a type of stone you have.  You want to know how many of the stones you have are also jewels.
 
 The letters in J are guaranteed distinct, and all characters in J and S are letters. Letters are case sensitive, so "a" is considered a different type of stone from "A".
 
 Example 1:
 
 Input: J = "aA", S = "aAAbbbb"
 Output: 3
 Example 2:
 
 Input: J = "z", S = "ZZ"
 Output: 0
 Note:
 
 S and J will consist of letters and have length at most 50.
 The characters in J are distinct.
 */

class Solution {
    func numJewelsInStones(_ J: String, _ S: String) -> Int {
        var count = 0
        var jewels: Set<Character> = []
        for j in J {
            jewels.insert(j)
        }
        for s in S {
            if jewels.contains(s) {
                count += 1
            }
        }
        return count
    }
}

let solution = Solution()
guard 3 == solution.numJewelsInStones("aA", "aAAbbbb") else { fatalError() }
guard 0 == solution.numJewelsInStones("z", "ZZ") else { fatalError() }

print("All tests passed")
