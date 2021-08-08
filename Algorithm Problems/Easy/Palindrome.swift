/**
 Difficulty: Easy
 
 Given an integer x, return true if x is palindrome integer.
 An integer is a palindrome when it reads the same backward as forward. For example, 121 is palindrome while 123 is not.
 
 ```
 Example 1:
 Input: x = 121
 Output: true
 
 Example 2:
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 
 Example 3:
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
 Example 4:
 Input: x = -101
 Output: false
 ```
 */

import Foundation

class PalindromeSolution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false
        } else if x < 10 {
            return true
        }
        
        let reversed = reverse(x)
        return reversed == x
    }
    
    private func reverse(_ x: Int) -> Int {
        var reverse = 0
        var x = x
        while x != 0 {
            let lastDigit = x % 10
            x /= 10
            reverse = reverse * 10 + lastDigit
            if reverse > Int32.max || reverse < Int32.min {
                return 0
            }
        }
        return reverse
    }
}
