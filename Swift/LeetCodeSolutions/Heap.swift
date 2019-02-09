//
//  Heap.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

import Foundation

/// A simple binary heap
final class Heap<T: Comparable> {
    
    private let isMinHeap: Bool
    private let comparator: (T, T) -> Bool
    private var heap: [T] = []
    var isEmpty: Bool { return heap.isEmpty }
    var count: Int { return heap.count }
    
    /// This is mostly for unit tests and debugging
    var isValid: Bool {
        for i in 1..<heap.count where !comparator(heap[parentIndex(of: i)], heap[i]) {
            return false
        }
        return true
    }
    
    init(isMinHeap: Bool) {
        self.isMinHeap = isMinHeap
        comparator = isMinHeap ? { $0 < $1 } : { $0 > $1 }
    }
    
    func push(element: T) {
        heap.append(element)
        riseElement(at: heap.count - 1)
    }
    
    @discardableResult func pop() -> T? {
        guard let r = heap.first else { return nil }
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        sinkRoot()
        return r
    }
}

extension Heap: CustomStringConvertible {
    var description: String {
        return "\(isMinHeap ? "Min Heap" : "Max Heap"): \(heap)"
    }
}

private extension Heap {
    func riseElement(at index: Int) {
        guard index < heap.count else { return }
        var current = index
        var parent = parentIndex(of: current)
        while current != 0, !comparator(heap[parent], heap[current]) {
            heap.swapAt(parent, current)
            current = parent
            parent = parentIndex(of: current)
        }
    }
    
    func sinkRoot() {
        var current = 0
        while true {
            let (leftChild, rightChild) = childrenIndex(of: current)
            if leftChild < heap.count, rightChild < heap.count {
                let winnerChild = comparator(heap[leftChild], heap[rightChild]) ? leftChild : rightChild
                if comparator(heap[winnerChild], heap[current]) {
                    heap.swapAt(winnerChild, current)
                    current = winnerChild
                } else {
                    break
                }
            } else if leftChild < heap.count, comparator(heap[leftChild], heap[current]) {
                heap.swapAt(leftChild, current)
                current = leftChild
            } else { // we don't need the right child case if we use array
                break
            }
        }
    }
    
    func parentIndex(of index: Int) -> Int {
        return max(0, (index - 1) / 2)
    }
    
    func childrenIndex(of index: Int) -> (Int, Int) {
        return ((index + 1) * 2 - 1, (index + 1) * 2)
    }
}
