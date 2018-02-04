/*
 
 717. 1-bit and 2-bit Characters
 
 We have two special characters. The first character can be represented by one bit 0. The second character can be represented by two bits (10 or 11).
 
 Now given a string represented by several bits. Return whether the last character must be a one-bit character or not. The given string will always end with a zero.
 
 Example 1:
 Input:
 bits = [1, 0, 0]
 Output: True
 Explanation:
 The only way to decode it is two-bit character and one-bit character. So the last character is one-bit character.
 Example 2:
 Input:
 bits = [1, 1, 1, 0]
 Output: False
 Explanation:
 The only way to decode it is two-bit character and two-bit character. So the last character is NOT one-bit character.
 Note:
 
 1 <= len(bits) <= 1000.
 bits[i] is always 0 or 1.
 */

class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        guard !bits.isEmpty else { return false }
        if bits.count == 1 {
            return bits == [0]
        } else if bits.count == 2 {
            return bits == [0, 0]
        } else if let last = bits.last, last == 1 {
            return false
        }
        
        let firstIndex = 2
        var isPrev1Char = bits[firstIndex - 2] == 0 && bits[firstIndex - 1] == 0
        var isPrev2Char = bits[firstIndex - 2] == 1
        for i in firstIndex..<bits.count {
            var canCurBe1Char = false
            var canCurBe2Char = false
            if isPrev1Char, !isPrev2Char {
                canCurBe1Char = bits[i] == 0
                canCurBe2Char = false
            } else if !isPrev1Char, isPrev2Char {
                canCurBe1Char = bits[i] == 0
                canCurBe2Char = false
            } else if !isPrev1Char, !isPrev2Char {
                canCurBe1Char = false
                canCurBe2Char = bits[i - 1] == 1
            } else {
                fatalError("Failed to parse")
            }
            isPrev1Char = canCurBe1Char
            isPrev2Char = canCurBe2Char
        }
        return isPrev1Char
    }
}

let solution = Solution()
guard true == solution.isOneBitCharacter([0]) else { fatalError() }
guard true == solution.isOneBitCharacter([1, 0, 0]) else { fatalError() }
guard false == solution.isOneBitCharacter([1, 1, 1, 0]) else { fatalError() }

print("All tests passed")
