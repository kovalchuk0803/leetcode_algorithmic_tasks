/**
 Given the root node of a binary search tree and two integers low and high,
 return the sum of values of all nodes with a value in the inclusive range [low, high].
 https://leetcode.com/problems/range-sum-of-bst/
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

class RangeOfSumBSTSolution {
    fileprivate func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root = root else {
            return 0
        }

        var stack: [TreeNode] = [root]
        var result = 0
        
        while !stack.isEmpty {
            let crnt = stack.removeLast()
            
            if low <= crnt.val && crnt.val <= high {
                result += crnt.val
            }
            
            if low < crnt.val, let left = crnt.left {
                stack.append(left)
            }
            
            if crnt.val < high, let right = crnt.right {
                stack.append(right)
            }
        }
        
        return result
    }
}
