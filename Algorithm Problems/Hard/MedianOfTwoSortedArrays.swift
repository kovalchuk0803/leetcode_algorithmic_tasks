/**
 Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.
 The overall run time complexity should be O(log (m+n)).

 ```
 Example 1:
 Input: nums1 = [1,3], nums2 = [2]
 Output: 2.00000
 Explanation: merged array = [1,2,3] and median is 2.
 
 Example 2:
 Input: nums1 = [1,2], nums2 = [3,4]
 Output: 2.50000
 Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 
 Example 3:
 Input: nums1 = [0,0], nums2 = [0,0]
 Output: 0.00000
 
 Example 4:
 Input: nums1 = [], nums2 = [1]
 Output: 1.00000
 
 Example 5:
 Input: nums1 = [2], nums2 = []
 Output: 2.00000
 ```
 */

import Foundation

final class MedianOfTwoSortedArraysSolution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let n = nums1.count
        let m = nums2.count
        if n > m {
            return findMedianSortedArrays(nums2, nums1)
        }
        
        var start = 0
        var end = n
        let middleIndexInMergedArray: Int = (n + m + 1) / 2
        
        while start <= end {
            let middleIndex = (start + end) / 2
            let leftNums1Size = middleIndex
            let leftNums2Size = middleIndexInMergedArray - middleIndex
            
            let leftNum1 = leftNums1Size > 0 ? nums1[leftNums1Size - 1] : Int.min
            let leftNum2 = leftNums2Size > 0 ? nums2[leftNums2Size - 1] : Int.min
            
            let rightNum1 = leftNums1Size < n ? nums1[leftNums1Size] : Int.max
            let rightNum2 = leftNums2Size < m ? nums2[leftNums2Size] : Int.max
            
            if leftNum1 <= rightNum2 && leftNum2 <= rightNum1 {
                if (m + n) % 2 == 0 {
                    let result = max(leftNum1, leftNum2) + min(rightNum1, rightNum2)
                    return Double(result) / 2
                }
                else {
                    let result = max(leftNum1, leftNum2)
                    return Double(result)
                }
            }
            else if leftNum1 > rightNum2 {
                end = middleIndex - 1
            }
            else {
                start = middleIndex + 1
            }
        }
        return 0.0
    }
}
