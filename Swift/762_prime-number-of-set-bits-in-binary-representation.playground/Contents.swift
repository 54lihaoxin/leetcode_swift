/*
 
 762. Prime Number of Set Bits in Binary Representation
 
 Given two integers L and R, find the count of numbers in the range [L, R] (inclusive) having a prime number of set bits in their binary representation.
 
 (Recall that the number of set bits an integer has is the number of 1s present when written in binary. For example, 21 written in binary is 10101 which has 3 set bits. Also, 1 is not a prime.)
 
 Example 1:
 
 Input: L = 6, R = 10
 Output: 4
 Explanation:
 6 -> 110 (2 set bits, 2 is prime)
 7 -> 111 (3 set bits, 3 is prime)
 8 -> 1000 (1 set bits, 1 is not prime)
 9 -> 1001 (2 set bits , 2 is prime)
 10->1010 (2 set bits , 2 is prime)
 Example 2:
 
 Input: L = 10, R = 15
 Output: 5
 Explanation:
 10 -> 1010 (2 set bits, 2 is prime)
 11 -> 1011 (3 set bits, 3 is prime)
 12 -> 1100 (2 set bits, 2 is prime)
 13 -> 1101 (3 set bits, 3 is prime)
 14 -> 1110 (3 set bits, 3 is prime)
 15 -> 1111 (4 set bits, 4 is not prime)
 Note:
 
 L, R will be integers L <= R in the range [1, 10^6].
 R - L will be at most 10000.
 */

class Solution {
    
    func countPrimeSetBits(_ L: Int, _ R: Int) -> Int {
        var count = 0
        for i in L...R {
            // Note: Given L and R in the range of [1, 10^6], and 10^6 is less than 2^20, there are less than 20 set bits
            //       and the max prime we need is 19 and we don't really need a `PrimeValidator`.
            if PrimeValidator.isPrime(n: numberOfSetBits(n: i)) {
                count += 1
            }
        }
        return count
    }
    
    private func numberOfSetBits(n: Int) -> Int {
        var setBits = 0
        var powerOf2 = 1
        repeat {
            if powerOf2 & n == powerOf2 {
                setBits += 1
            }
            powerOf2 <<= 1
        } while powerOf2 < n * 2
        return setBits
    }
}

class PrimeValidator {
    
    private static var cachedPrimeSet: Set<Int> = [2]
    private static var maxValidatedNumber: Int = 2
    
    static func isPrime(n: Int) -> Bool {
        guard 1 < n else { return false }
        if maxValidatedNumber < n {
            calculatePrimes(upTo: n)
        }
        return cachedPrimeSet.contains(n)
    }
    
    private static func calculatePrimes(upTo n: Int) {
        guard maxValidatedNumber < n else { return }
        for i in (maxValidatedNumber + 1)...n {
            var isPrime = true
            for prime in cachedPrimeSet {
                if i % prime == 0 {
                    isPrime = false
                    break
                }
            }
            if isPrime {
                cachedPrimeSet.insert(i)
            }
        }
        maxValidatedNumber = n
    }
}

let solution = Solution()
guard 4 == solution.countPrimeSetBits(6, 10) else { fatalError() }
guard 5 == solution.countPrimeSetBits(10, 15) else { fatalError() }

print("All tests passed")
