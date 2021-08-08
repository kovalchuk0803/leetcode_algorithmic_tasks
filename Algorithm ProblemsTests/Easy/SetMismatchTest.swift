/**
 You have a set of integers s, which originally contains all the numbers from 1 to n. Unfortunately, due to some error, one of the numbers in s got duplicated to another number in the set, which results in repetition of one number and loss of another number.
 
 You are given an integer array nums representing the data status of this set after the error.
 Find the number that occurs twice and the number that is missing and return them in the form of an array.
 ```
 Example 1:
 Input: nums = [1,2,2,4]
 Output: [2,3]
 
 Example 2:
 Input: nums = [1,1]
 Output: [1,2]
 
 Example 3:
 Input: nums = [2,2]
 Output: [2,1]
 
 Example 4:
 Input: nums = [1,2,2]
 Output: [2,3]
 
 Example 5:
 Input: nums = [3,2,2]
 Output: [2,1]
 ```
 */

import XCTest

class SetMismatchTest: XCTestCase {

    private let testCases = [
        [1, 2, 2, 4]: [2, 3],
        [1, 1]: [1, 2],
        [2, 2]: [2, 1],
        [1, 2, 2]: [2, 3],
        [3, 2, 2]: [2, 1]
    ]
    
    func test() {
        let solution = SetMismatchSolution()
        for (input, output) in testCases {
            let result = solution.findErrorNums(input)
            XCTAssertEqual(result, output)
        }
    }
}
