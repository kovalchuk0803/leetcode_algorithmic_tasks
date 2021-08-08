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

public class ListNode: CustomDebugStringConvertible, Equatable {
    
    public var val: Int
    public var next: ListNode?
    
    public var debugDescription: String {
        var str = ""
        var node = self
        while true {
            str += String(node.val)
            if node.next == nil {
                break
            } else {
                node = node.next!
                str += " -> "
            }
        }
        return str
    }
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
    
    init(array: [Int]) {
        var previous: ListNode?
        for val in array.reversed() {
            let node = ListNode(val, previous)
            previous = node
        }
        self.val = previous?.val ?? 0
        self.next = previous?.next
    }
    
    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
        return lhs.val == rhs.val && lhs.next == rhs.next
    }
 }


class AddTwoNumbersSolution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1: ListNode? = l1
        var l2: ListNode? = l2
        
        var carry = 0
        var head: ListNode? = ListNode(0)
        let result = head
        
        while l1 != nil || l2 != nil || carry > 0 {
            let first = l1?.val ?? 0
            let second = l2?.val ?? 0
            let sum = first + second + carry
            carry = sum / 10
            let val = sum % 10
            
            l1 = l1?.next
            l2 = l2?.next
            head?.next = ListNode(val)
            head = head?.next
        }
        
        return result?.next
    }
}
