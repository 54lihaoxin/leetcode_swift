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
