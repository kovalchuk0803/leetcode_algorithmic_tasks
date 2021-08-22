/**
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.
 You must write an algorithm with O(log n) runtime complexity.
 
 ```
 Example 1:
 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 
 Example 2:
 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1
 ```
 */

import XCTest

class BinarySearchTest: XCTestCase {
    
    let testCases = [
        ([-1, 0, 3, 5, 9, 12], 9, 4),
        ([-1, 0, 3, 5, 9, 12], 2, -1),
        ([3], 3, 0),
        ([2], 1, -1)
    ]
    
    func test() {
        let solution = BinarySearchSolution()
        for testCase in testCases {
            let actualResult = solution.search(testCase.0, testCase.1)
            XCTAssertEqual(actualResult, testCase.2)
        }
    }
}
