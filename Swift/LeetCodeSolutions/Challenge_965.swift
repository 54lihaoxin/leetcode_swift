//
//  Challenge_965.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/9/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 965. Univalued Binary Tree
 
 A binary tree is univalued if every node in the tree has the same value.
 
 Return true if and only if the given tree is univalued.
 
 
 
 Example 1:
 
 
 Input: [1,1,1,1,1,null,1]
 Output: true
 Example 2:
 
 
 Input: [2,2,2,5,2]
 Output: false
 
 
 Note:
 
 The number of nodes in the given tree will be in the range [1, 100].
 Each node's value will be an integer in the range [0, 99].
 
 */

import Foundation

enum Challenge {
    
    static let name = "Challenge 965"
    
    static func run() {
        let solution = Solution()
        guard false == solution.isUnivalTree({
            let root = TreeNode(1)
            root.left = TreeNode(2)
            return root
            }()) else { fatalError() }
        print("All tests passed")
    }
}

final class Solution {
    func isUnivalTree(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        return isUnivalTreeForParentValue(root.val, root.left) && isUnivalTreeForParentValue(root.val, root.right)
    }
    
    func isUnivalTreeForParentValue(_ parentValue: Int, _ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        
        guard root.val == parentValue else {
            return false
        }
        
        if let leftNode = root.left {
            if leftNode.val == parentValue {
                if !isUnivalTreeForParentValue(parentValue, leftNode) {
                    return false
                }
            } else {
                return false
            }
        }
        
        if let rightNode = root.right {
            if rightNode.val == parentValue {
                if !isUnivalTreeForParentValue(parentValue, rightNode) {
                    return false
                }
            } else {
                return false
            }
        }
        
        return true
    }
}
