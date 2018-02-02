/*
 
 728. Self Dividing Numbers
 
 A self-dividing number is a number that is divisible by every digit it contains.
 
 For example, 128 is a self-dividing number because 128 % 1 == 0, 128 % 2 == 0, and 128 % 8 == 0.
 
 Also, a self-dividing number is not allowed to contain the digit zero.
 
 Given a lower and upper number bound, output a list of every possible self dividing number, including the bounds if possible.
 
 Example 1:
 Input:
 left = 1, right = 22
 Output: [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22]
 Note:
 
 The boundaries of each input argument are 1 <= left <= right <= 10000.
 */

class Solution {
    
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var result: [Int] = []
        for n in left...right {
            if isSelfDividingNumber(n) {
                result.append(n)
            }
        }
        return result
    }
    
    func isSelfDividingNumber(_ n: Int) -> Bool {
        switch n {
        case ...0:
            return false
        case 1...9:
            return true
        case 10:
            return false
        default:
            var cur = n
            while cur != 0 {
                let r = cur % 10
                if r == 0 {
                    return false
                } else if n % r != 0 {  // r != 0, but not divisible
                    return false
                }
                cur /= 10
            }
            return true
        }
    }
}

let solution = Solution()
guard [1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 12, 15, 22] == solution.selfDividingNumbers(1, 22) else { fatalError() }

print("All tests passed")
