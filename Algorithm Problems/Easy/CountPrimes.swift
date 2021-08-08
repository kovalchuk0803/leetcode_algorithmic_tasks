/**
 Difficulty: Easy
 
 Count the number of prime numbers less than a non-negative number `n`
 Sieve of Eratosthenes https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
 ```
 Example 1:
 Input: n = 10
 Output: 4
 Explanation: There are 4 prime numbers less than 10, they are 2, 3, 5, 7.
 
 Example 2:
 Input: n = 0
 Output: 0
 
 Example 3:
 Input: n = 1
 Output: 0
 ```
 */

import Foundation

class CountPrimesSolution {
    func countPrimes(_ n: Int) -> Int {
        guard n > 2 else { return 0 }
        
        var leastPrime = [Int](repeating: 0, count: n + 1)
        var primes: [Int] = []
        for i in 2..<n {
            if leastPrime[i] == 0 {
                leastPrime[i] = i
                primes.append(i)
            }
            
            for p in primes {
                let x = p * i
                if p > leastPrime[i] || x > n {
                    break
                } else {
                    leastPrime[x] = p
                }
            }
        }
        return primes.count
    }
}
