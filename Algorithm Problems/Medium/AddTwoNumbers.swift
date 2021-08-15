/**
 Difficulty: Medium
 
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.
 You may assume the two numbers do not contain any leading zero, except the number 0 itself.
 ```
 Example 1:
 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807
 
 Example 2:
 Input: l1 = [0], l2 = [0]
 Output: [0]
 
 Example 3:
 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]
 ```
 */

import Foundation

final class AddTwoNumbersSolution {
    func addTwoNumbers(_ l1: SinglyLinkedListNode<Int>?, _ l2: SinglyLinkedListNode<Int>?) -> SinglyLinkedListNode<Int>? {
        var l1 = l1
        var l2 = l2
        
        var carry = 0
        var head: SinglyLinkedListNode? = SinglyLinkedListNode(value: 0)
        let result = head
        
        while l1 != nil || l2 != nil || carry > 0 {
            let first = l1?.value ?? 0
            let second = l2?.value ?? 0
            let sum = first + second + carry
            carry = sum / 10
            let val = sum % 10
            
            l1 = l1?.next
            l2 = l2?.next
            head?.next = SinglyLinkedListNode(value: val)
            head = head?.next
        }
        
        return result?.next
    }
}
