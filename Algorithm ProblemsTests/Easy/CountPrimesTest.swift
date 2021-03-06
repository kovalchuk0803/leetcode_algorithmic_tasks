/**
 Difficulty: Easy
 
 Count the number of prime numbers less than a non-negative number `n`
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

import XCTest

class CountPrimesTest: XCTestCase {

    private let testCases = [
        10: 4,
        0: 0,
        1: 0,
        8: 4,
        2: 0
    ]
    
    func test() {
        let solution = CountPrimesSolution()
        for (cs, result) in testCases {
            let actualResult = solution.countPrimes(cs)
            XCTAssertEqual(actualResult, result, "expected result for \(cs) is \(result), but got \(actualResult)")
        }
    }
}
