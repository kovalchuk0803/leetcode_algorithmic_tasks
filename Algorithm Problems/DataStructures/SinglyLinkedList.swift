//
//  SinglyLinkedList.swift
//  SinglyLinkedList
//
//  Created by Илья Ковальчук on 15.08.2021.
//

import Foundation

/**
 `Linked list` is a linear collection of data elements whose order is not given by their physical placement in memory.
 Instead, each element points to the next.
 It is a data structure consisting of a collection of nodes which together represent a sequence.
 
 Time complexity:
 - Access O(n)
 - Search O(n)
 - Insertion O(1)
 - Deletion O(1)
 */
final class SinglyLinkedListNode<Element> {
    var value: Element?
    var next: SinglyLinkedListNode?

    init(value: Element? = nil, next: SinglyLinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    init(nodes: [Element?]) {
        var previous: SinglyLinkedListNode?
        for value in nodes.reversed() {
            let node = SinglyLinkedListNode(value: value, next: previous)
            previous = node
        }
        self.value = previous?.value
        self.next = previous?.next
    }
}

extension SinglyLinkedListNode: Equatable where Element: Equatable {
    static func == (lhs: SinglyLinkedListNode<Element>, rhs: SinglyLinkedListNode<Element>) -> Bool {
        lhs.value == rhs.value && lhs.next == rhs.next
    }
}

// MARK: - SinglyLinkedListNode + CustomStringConvertible

extension SinglyLinkedListNode: CustomStringConvertible where Element: CustomStringConvertible {
    var description: String {
        var str = ""
        var node = self
        while true {
            str += value?.description ?? "nil"
            if node.next == nil {
                break
            } else {
                node = node.next!
                str += " -> "
            }
        }
        return str
    }
}
