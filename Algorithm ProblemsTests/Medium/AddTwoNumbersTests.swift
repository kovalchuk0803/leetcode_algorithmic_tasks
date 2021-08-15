/**
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

import XCTest

class AddTwoNumbersTests: XCTestCase {

    private struct TestCase {
        let l1: SinglyLinkedListNode<Int>
        let l2: SinglyLinkedListNode<Int>
        let result: SinglyLinkedListNode<Int>
        
        init(l1: [Int], l2: [Int], result: [Int]) {
            self.l1 = SinglyLinkedListNode(nodes: l1)
            self.l2 = SinglyLinkedListNode(nodes: l2)
            self.result = SinglyLinkedListNode(nodes: result)
        }
    }
    
    private let testCases = [
        TestCase(l1: [2,4,3], l2: [5,6,4], result: [7, 0, 8]),
        TestCase(l1: [0], l2: [0], result: [0]),
        TestCase(l1: [9,9,9,9,9,9,9], l2: [9,9,9,9], result: [8,9,9,9,0,0,0,1])
    ]
    
    func test() {
        let solution = AddTwoNumbersSolution()
        for cs in testCases {
            let result = solution.addTwoNumbers(cs.l1, cs.l2)
            XCTAssertEqual(result, cs.result)
        }
    }
}
