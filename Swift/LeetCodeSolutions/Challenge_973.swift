//
//  Challenge_973.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 2/8/19.
//  Copyright © 2019 Haoxin Li. All rights reserved.
//

/*
 
 973. K Closest Points to Origin
 
 We have a list of points on the plane.  Find the K closest points to the origin (0, 0).
 
 (Here, the distance between two points on a plane is the Euclidean distance.)
 
 You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)
 
 Example 1:
 
 Input: points = [[1,3],[-2,2]], K = 1
 Output: [[-2,2]]
 Explanation:
 The distance between (1, 3) and the origin is sqrt(10).
 The distance between (-2, 2) and the origin is sqrt(8).
 Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
 We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
 Example 2:
 
 Input: points = [[3,3],[5,-1],[-2,4]], K = 2
 Output: [[3,3],[-2,4]]
 (The answer [[-2,4],[3,3]] would also be accepted.)
 
 
 Note:
 
 1 <= K <= points.length <= 10000
 -10000 < points[i][0] < 10000
 -10000 < points[i][1] < 10000
 
 */

import Foundation

enum Challenge {
    
    static let name = "Challenge 973"
    
    static func run() {
        let solution = Solution()
        guard [[-2,2]] == solution.kClosest([[1,3],[-2,2]], 1) else { fatalError() }
        guard Set([[-11,17],[10,25],[25,19],[29,14],[5,-37],[-29,-29]]) == Set(solution.kClosest([[-93,70],[-22,-64],[-86,-33],[93,-74],[-7,-78],[5,-37],[-11,-84],[-29,-29],[-43,-17],[-11,17],[9,-64],[10,25],[29,14],[25,19],[42,71],[52,30],[-76,19],[66,40],[99,-61]], 6)) else { fatalError() }
        print("All tests passed")
    }
}

final class FasterButFatterSolution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let sortedPoints = points.sorted {
            ($0[0] * $0[0] + $0[1] * $0[1]) < ($1[0] * $1[0] + $1[1] * $1[1])
        }
        return Array(sortedPoints.prefix(K))
    }
}

final class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        let heap = Heap<Point>(isMinHeap: false)
        points.forEach {
            heap.push(element: Point(x: $0[0], y: $0[1]))
            if heap.count > K {
                heap.pop()
            }
        }
        
        var result = [[Int]]()
        while let point = heap.pop() {
            result.append([point.x, point.y])
        }
        
        return result
    }
}

extension Solution {
    struct Point: Comparable {
        let x: Int
        let y: Int
        private let distance: Double
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
            distance = Double(x * x + y * y).squareRoot()
        }
        
        static func < (lhs: Point, rhs: Point) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
}
