//
//  Challenge_876.swift
//  LeetCodeSolutions
//
//  Created by Li, Haoxin on 8/7/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//


/*
 
 876. Middle of the Linked List
 
 Given a non-empty, singly linked list with head node head, return a middle node of linked list.
 
 If there are two middle nodes, return the second middle node.
 
 
 
 Example 1:
 
 Input: [1,2,3,4,5]
 Output: Node 3 from this list (Serialization: [3,4,5])
 The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
 Note that we returned a ListNode object ans, such that:
 ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.
 Example 2:
 
 Input: [1,2,3,4,5,6]
 Output: Node 4 from this list (Serialization: [4,5,6])
 Since the list has two middle nodes with values 3 and 4, we return the second one.
 
 
 Note:
 
 The number of nodes in the given list will be between 1 and 100.
 
 */

import Foundation

enum Challenge {
    
    static let name = "Challenge 876"
    
    static func run() {
        let solution = Solution()
        let node = ListNode(123)
        solution.middleNode(node)
        print("All tests passed")
    }
}

class Node {
    var val: Any?
    var next: Node?
}

final class ListNode<Value> {
    var val: Value
    var next: ListNode?
    
    init(_ val: Value) {
        self.val = val
        self.next = nil
    }
}

indirect enum BinaryTree<T> {
    case empty
    case node(BinaryTree, T, BinaryTree)
    
    // 1.
    mutating func naiveInsert(newValue: T) {
        // 2.
        guard case .node(var left, let value, var right) = self else {
            // 3.
            self = .node(.empty, newValue, .empty)
            return
        }
        
        // 4. TODO: Implement rest of algorithm!
        
    }

}


final class Solution {
    func middleNode<T>(_ head: ListNode<T>?) -> ListNode<T>? {
        
        var binaryTree: BinaryTree<Int> = .empty
        binaryTree.naiveInsert(newValue: 5) // binaryTree now has a node value with 5
        binaryTree.naiveInsert(newValue: 7) // binaryTree is unchanged
        binaryTree.naiveInsert(newValue: 9) // binaryTree is unchanged
        
        return nil
    }
}
