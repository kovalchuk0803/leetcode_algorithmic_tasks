/**
 Given the root of a binary tree, return the postorder traversal of its nodes' values.
 https://leetcode.com/problems/binary-tree-postorder-traversal/
 */

import Foundation

fileprivate class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class BinaryTreePostorderTraversalSolution {
    fileprivate func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var stack: [TreeNode?] = []
        var result: [Int] = []
        stack.append(root)
        
        while !stack.isEmpty {
            if let node = stack.removeLast() {
                result.insert(node.val, at: 0)
                
                if let left = node.left {
                    stack.append(left)
                }
                if let right = node.right {
                    stack.append(right)
                }
            }
        }
        return result
    }
}
