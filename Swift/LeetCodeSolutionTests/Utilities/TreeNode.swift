//
//  TreeNode.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/9/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

import Foundation

/// ugly TreeNode from LeetCode
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

extension TreeNode {
    static func intSequenceToTree<S: Sequence>(_ sequence: S) -> TreeNode? where S.Iterator.Element == Int {
        // TODO
        return nil
    }
}


// MARK: -

final class ComparableTreeNode<T: Comparable> {
    private(set) var value: T
    var leftNode: ComparableTreeNode?
    var rightNode: ComparableTreeNode?
    
    init(value: T, leftNode: ComparableTreeNode?, rightNode: ComparableTreeNode?) {
        self.value = value
        self.leftNode = leftNode
        self.rightNode = rightNode
    }
}

extension ComparableTreeNode {
    static func arraySliceToTree<S: Sequence>(_ array: S) -> ComparableTreeNode? where S.Iterator.Element == T {
        // TODO
        return nil
    }
}
