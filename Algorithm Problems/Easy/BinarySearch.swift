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

import Foundation

final class BinarySearchSolution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        
        while leftIndex <= rightIndex {
            let middleIndex: Int = (leftIndex + rightIndex) / 2
            let middle = nums[middleIndex]
            
            if middle == target {
                return middleIndex
            }
            else if middle < target {
                leftIndex = middleIndex + 1
            }
            else {
                rightIndex = middleIndex - 1
            }
        }
        return -1
    }
}
