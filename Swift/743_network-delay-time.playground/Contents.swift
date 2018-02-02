/*
 There are N network nodes, labelled 1 to N.
 
 Given times, a list of travel times as directed edges times[i] = (u, v, w), where u is the source node, v is the target node, and w is the time it takes for a signal to travel from source to target.
 
 Now, we send a signal from a certain node K. How long will it take for all nodes to receive the signal? If it is impossible, return -1.
 
 Note:
 N will be in the range [1, 100].
 K will be in the range [1, N].
 The length of times will be in the range [1, 6000].
 All edges times[i] = (u, v, w) will have 1 <= u, v <= N and 1 <= w <= 100.
 */


// MARK: - Library

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
    
    mutating func sinkRoot() {
        var current = 0
        while true {
            let (leftChild, rightChild) = childrenIndex(of: current)
            if leftChild < heap.count, rightChild < heap.count {
                let winnerChild = comparator(heap[leftChild], heap[rightChild]) ? leftChild : rightChild
                heap.swapAt(winnerChild, current)
                current = winnerChild
            } else if leftChild < heap.count, comparator(heap[leftChild], heap[current]) {
                heap.swapAt(leftChild, current)
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


// MARK: - Solution

typealias Node = Int
typealias TravelTime = Int

extension Array where Element == Int {
    var sourceNode: Node { return self[0] }
    var targetNode: Node { return self[1] }
    var travelTime: TravelTime { return self[2] }
}

class Solution {
    
    func networkDelayTime(_ times: [[Int]], _ N: Int, _ K: Int) -> Int {
        var visitedNodesVsTravelTime = [K: 0]
        var edgeRecords = edgeDict(edges: times.map { Edge(parameters: $0) })   // group edges by source node
        var edgesToTravel = Heap<Edge>(isMinHeap: true)
        for edge in edgeRecords[K] ?? [] {  // first edges from the initial node
            edgesToTravel.push(element: edge)
        }
        
        repeat {
            guard let edge = edgesToTravel.pop() else { break } // return when running out of edges
            if let t = visitedNodesVsTravelTime[edge.targetNode] {
                if edge.sourceNode == K, edge.travelTime < t {
                    visitedNodesVsTravelTime[edge.targetNode] = edge.travelTime
                }
            } else {
                visitedNodesVsTravelTime[edge.targetNode] = edge.travelTime
            }
            
            for nextEdge in edgeRecords[edge.targetNode] ?? [] {    // IMPORTANT: combine two edges into one, eventually connecting all nodes directly with the initial node
                guard edge.sourceNode != nextEdge.targetNode else { continue }  // prevent loop
                guard edge.travelTime + nextEdge.travelTime < visitedNodesVsTravelTime[nextEdge.targetNode] ?? Int.max else { continue }    // reduce computation
                edgesToTravel.push(element: Edge(sourceNode: edge.sourceNode,
                                                 targetNode: nextEdge.targetNode,
                                                 travelTime: edge.travelTime + nextEdge.travelTime))
            }
        } while visitedNodesVsTravelTime.count < N
        
        return visitedNodesVsTravelTime.count == N ? visitedNodesVsTravelTime.values.max() ?? -1 : -1
    }
    
    // For the returned dictionary, K is the source node, and V is the array of edges with the same source.
    func edgeDict(edges: [Edge]) -> [Node: [Edge]] {
        var dict: [Node: [Edge]] = [:]
        for e in edges {
            if dict[e.sourceNode] == nil {
                dict[e.sourceNode] = [Edge]()
            }
            dict[e.sourceNode]?.append(e)
        }
        return dict
    }
}

struct Edge {
    
    let sourceNode: Node
    let targetNode: Node
    let travelTime: TravelTime
    
    init(sourceNode: Node, targetNode: Node, travelTime: TravelTime) {
        self.sourceNode = sourceNode
        self.targetNode = targetNode
        self.travelTime = travelTime
    }
    
    init(parameters: [Int]) {
        guard parameters.count == 3 else { fatalError() }
        sourceNode = parameters[0]
        targetNode = parameters[1]
        travelTime = parameters[2]
    }
}

extension Edge: Comparable {
    
    static func == (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.sourceNode == rhs.sourceNode
            && lhs.targetNode == rhs.targetNode
            && lhs.travelTime == rhs.travelTime
    }
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.travelTime < rhs.travelTime
    }
}

extension Edge: CustomStringConvertible {
    var description: String {
        return "\(sourceNode) -> \(targetNode) = \(travelTime)"
    }
}

struct VisitedNode {
    let index: Int
    let visitTime: Int
}


// MARK: - Test Cases

let solution = Solution()
guard 52 == solution.networkDelayTime([[4,3,76],[1,4,70],[1,3,37],[1,2,53],[3,2,66],[3,4,22],[5,4,52],[2,1,23],[5,1,27],[4,5,88],[5,2,26],[2,4,41],[4,2,66],[4,1,93],[3,5,78],[2,5,9],[5,3,50],[3,1,17],[1,5,12],[2,3,87]],
                                      5,
                                      5) else { fatalError() }
guard 2 == solution.networkDelayTime([[2,1,1],[2,3,1],[3,4,1]],
                                     4,
                                     2) else { fatalError() }
guard -1 == solution.networkDelayTime([[1,2,1],[2,3,7],[1,3,4],[2,1,2]],
                                      4,
                                      1) else { fatalError() }

print("All tests passed")
