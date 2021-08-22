/**
 Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

 You must write an algorithm with O(log n) runtime complexity.
 
 ```
 Example 1:
 Input: nums = [1,3,5,6], target = 5
 Output: 2
 
 Example 2:
 Input: nums = [1,3,5,6], target = 2
 Output: 1
 
 Example 3:
 Input: nums = [1,3,5,6], target = 7
 Output: 4
 
 Example 4:
 Input: nums = [1,3,5,6], target = 0
 Output: 0
 
 Example 5:
 Input: nums = [1], target = 0
 Output: 0
 ```
 */

import Foundation

final class SearchInsertPositionSolution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
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
        return leftIndex
    }
}
