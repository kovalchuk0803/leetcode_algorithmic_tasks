//
//  BinarySearchTree.swift
//  BinarySearchTree
//
//  Created by Илья Ковальчук on 15.08.2021.
//

import Foundation

final class BSTNode<Element: Comparable> {
    
    // MARK: - Public properties
    
    var value: Element
    var left: BSTNode?
    var right: BSTNode?
    weak var parent: BSTNode?
    
    var isRoot: Bool { parent == nil }
    var isLeaf: Bool { left == nil && right == nil }
    var isLeftChild: Bool { parent?.left === self }
    var isRightChild: Bool { parent?.right === self }
    var hasLeftChild: Bool { left != nil }
    var hasRightChild: Bool { right != nil }
    
    // MARK: - Initialization
    
    init(value: Element, left: BSTNode? = nil, right: BSTNode? = nil, parent: BSTNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    init(nodes: [Element]) {
        precondition(nodes.count > 0)
        self.value = nodes.first!
        nodes.dropFirst().forEach { insert(value: $0) }
    }
    
    // MARK: - Public methods
    
    func insert(value: Element) {
        if value < self.value {
            if let left = left {
                left.insert(value: value)
            } else {
                let left = BSTNode(value: value, parent: self)
                self.left = left
            }
        } else {
            if let right = right {
                right.insert(value: value)
            } else {
                let right = BSTNode(value: value, parent: self)
                self.right = right
            }
        }
    }
    
    // TODO: - Check once more
    @discardableResult
    func remove() -> BSTNode? {
        let replacement: BSTNode?
        if let left = left {
            replacement = left.max()
        } else if let right = right {
            replacement = right.min()
        } else {
            replacement = nil
        }
        replacement?.remove()
        
        replacement?.right = right
        replacement?.left = left
        right?.parent = replacement
        left?.parent = replacement
        relinkParentTo(node: replacement)
        
        parent = nil
        left = nil
        right = nil
        
        return replacement
    }
    
    func search(value: Element) -> BSTNode? {
        var node: BSTNode? = self
        while let n = node {
            if value < n.value {
                node = n.left
            } else if value > n.value {
                node = n.right
            } else {
                return n
            }
        }
        return nil
    }
    
    func min() -> BSTNode {
        var node = self
        while let next = node.left {
            node = next
        }
        return node
    }
    
    func max() -> BSTNode {
        var node = self
        while let next = node.right {
            node = next
        }
        return node
    }
    
    func lmr(_ process: (_ value: Element) throws -> Void) rethrows {
        try left?.lmr(process)
        try process(value)
        try right?.lmr(process)
    }
    
    func rml(_ process: (_ value: Element) throws -> Void) rethrows {
        try right?.rml(process)
        try process(value)
        try left?.rml(process)
    }
    
    func map(_ transform: (Element) throws -> Element) rethrows -> [Element] {
        var result: [Element] = []
        if let left = left {
            result += try left.map(transform)
        }
        
        result.append(try transform(value))
        
        if let right = right {
            result += try right.map(transform)
        }
        
        return result
    }
    
    func toArrayAsc() -> [Element] {
        var result: [Element] = []
        lmr { result.append($0) }
        return result
    }
    
    func toArrayDesc() -> [Element] {
        var result: [Element] = []
        rml { result.append($0) }
        return result
    }
    
    // MARK: - Private methods
    
    private func relinkParentTo(node: BSTNode?) {
        guard let parent = parent else {
            return
        }
        
        if isLeftChild {
            parent.left = node
        } else {
            parent.right = node
        }
        node?.parent = parent
    }
}

// MARK: - BSTNode + CustomStringConvertible

extension BSTNode: CustomStringConvertible {
    var description: String {
        var s = ""
        if let left = left {
            s += "(\(left.description)) <- "
        }
        s += "\(value)"
        if let right = right {
            s += " -> (\(right.description))"
        }
        return s
    }
}
