//
//  Challenge_695.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 8/4/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

/*
 
 695. Max Area of Island
 
 Given a non-empty 2D array grid of 0's and 1's, an island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
 
 Find the maximum area of an island in the given 2D array. (If there is no island, the maximum area is 0.)
 
 Example 1:
 [[0,0,1,0,0,0,0,1,0,0,0,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,1,1,0,1,0,0,0,0,0,0,0,0],
 [0,1,0,0,1,1,0,0,1,0,1,0,0],
 [0,1,0,0,1,1,0,0,1,1,1,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0],
 [0,0,0,0,0,0,0,1,1,1,0,0,0],
 [0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Given the above grid, return 6. Note the answer is not 11, because the island must be connected 4-directionally.
 Example 2:
 [[0,0,0,0,0,0,0,0]]
 Given the above grid, return 0.
 Note: The length of each dimension in the given grid does not exceed 50.
 
 */

import Foundation

enum Challenge_695: Challenge {
    
    static let name = "Challenge 695"
    
    static func runTests() {
        let solution = Solution()
        guard 0 == solution.maxAreaOfIsland([[]]) else { fatalError() }
        guard 0 == solution.maxAreaOfIsland([[0,0,0,0,0,0,0,0]]) else { fatalError() }
        guard 6 == solution.maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],
                                             [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                             [0,1,1,0,1,0,0,0,0,0,0,0,0],
                                             [0,1,0,0,1,1,0,0,1,0,1,0,0],
                                             [0,1,0,0,1,1,0,0,1,1,1,0,0],
                                             [0,0,0,0,0,0,0,0,0,0,1,0,0],
                                             [0,0,0,0,0,0,0,1,1,1,0,0,0],
                                             [0,0,0,0,0,0,0,1,1,0,0,0,0]]) else { fatalError() }
        guard 4 == solution.maxAreaOfIsland([[1,1,0,0,0],
                                             [1,1,0,0,0],
                                             [0,0,0,1,1],
                                             [0,0,0,1,1]]) else { fatalError() }
        print("All tests passed")
    }
}

fileprivate final class Solution {
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        return TwoDimensionalWorld(matrix: grid).exploreForMaxIslandSize()
    }
}

final class TwoDimensionalWorld: TwoDimensionalMatrix {
    
    typealias Element = Int
    
    enum Status: Int {
        case water = 0
        case land = 1
        case explored = 2
    }
    
    private(set) var matrix: [[Element]]
    
    init(matrix: [[Element]]) {
        self.matrix = matrix
        guard isValidMatrix else {
            fatalError()
        }
    }
    
    func exploreForMaxIslandSize() -> Int {
        var maxSize = 0
        for (r, row) in matrix.enumerated() {
            for (c, _) in row.enumerated() {
                maxSize = max(maxSize, explore(from: TwoDimensionalMatrixLocation(row: r, column: c)))
            }
        }
        return maxSize
    }
}

private extension TwoDimensionalWorld {
    
    func isLocation(_ location: TwoDimensionalMatrixLocation, inStatus status: TwoDimensionalWorld.Status) -> Bool {
        return element(at: location) == status.rawValue
    }
    
    func updateLocation(_ location: TwoDimensionalMatrixLocation, withStatus status: TwoDimensionalWorld.Status) {
        matrix[location.row][location.column] = status.rawValue
    }
    
    /// Mark expored locations as `explored`. Return the size of island, if there is one.
    func explore(from startLocation: TwoDimensionalMatrixLocation) -> Int {
        guard isLocation(startLocation, inStatus: .land) else {
            updateLocation(startLocation, withStatus: .explored)
            return 0
        }
        var candidateLocations: Set<TwoDimensionalMatrixLocation> = [startLocation] // avoid duplicate neighbors
        var size = 0
        while !candidateLocations.isEmpty {
            let location = candidateLocations.removeFirst()
            let landNeighbors = neighbors(of: location).filter { isLocation($0, inStatus: .land) }
            landNeighbors.forEach { candidateLocations.insert($0) }
            updateLocation(location, withStatus: .explored)
            size += 1
        }
        return size
    }
}
