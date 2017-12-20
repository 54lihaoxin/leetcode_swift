/// A simple binary heap
struct Heap<T: Comparable> {
    
    fileprivate let isMinHeap: Bool
    fileprivate let comparator: (T, T) -> Bool
    fileprivate var heap: [T] = []
    var isEmpty: Bool { return heap.isEmpty }
    var count: Int { return heap.count }
    
    init(isMinHeap: Bool) {
        self.isMinHeap = isMinHeap
        comparator = isMinHeap ? { $0 < $1 } : { $0 > $1 }
    }
    
    mutating func push(element: T) {
        heap.append(element)
        riseElement(at: heap.count - 1)
    }
    
    mutating func pop() -> T? {
        guard let r = heap.first else { return nil }
        heap.swapAt(0, heap.count - 1)
        heap.removeLast()
        sinkElement(at: 0)
        return r
    }
}

extension Heap: CustomStringConvertible {
    var description: String {
        return "\(isMinHeap ? "Min Heap" : "Max Heap"): \(heap)"
    }
}

private extension Heap {
    
    mutating func riseElement(at index: Int) {
        guard index < heap.count else { return }
        var current = index
        var parent = parentIndex(of: current)
        while current != 0, !comparator(heap[parent], heap[current]) {
            heap.swapAt(parent, current)
            current = parent
            parent = parentIndex(of: current)
        }
    }
    
    mutating func sinkElement(at index: Int) {
        guard index < heap.count else { return }
        var current = index
        while true {
            let (leftChild, rightChild) = childrenIndex(of: current)
            if leftChild < heap.count, rightChild < heap.count {
                let winnerChild = comparator(heap[leftChild], heap[rightChild]) ? leftChild : rightChild
                heap.swapAt(current, winnerChild)
                current = winnerChild
            } else if leftChild < heap.count, !comparator(heap[index], heap[leftChild]) {
                heap.swapAt(current, leftChild)
                current = leftChild
            } else {    // we don't need the right child case if we use array
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
