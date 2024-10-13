//
//  Challenge_70.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 11/7/22.
//  Copyright © 2022 Haoxin Li. All rights reserved.
//

/*

 200. Number of Islands
 Medium
 Topics
 Companies
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.

 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.



 Example 1:

 Input: grid = [
   ["1","1","1","1","0"],
   ["1","1","0","1","0"],
   ["1","1","0","0","0"],
   ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:

 Input: grid = [
   ["1","1","0","0","0"],
   ["1","1","0","0","0"],
   ["0","0","1","0","0"],
   ["0","0","0","1","1"]
 ]
 Output: 3


 Constraints:

 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] is '0' or '1'.

 */

import XCTest

final class SolutionTests200: XCTestCase {
    func testSolution() throws {
        let solution = Solution()
        XCTAssertEqual(1, solution.numIslands([
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ]))

        XCTAssertEqual(3, solution.numIslands([
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ]))

        XCTAssertEqual(2, solution.numIslands([
            ["1","1","1","1","1","0","1","1","1","1"],
            ["1","0","1","0","1","1","1","1","1","1"],
            ["0","1","1","1","0","1","1","1","1","1"],
            ["1","1","0","1","1","0","0","0","0","1"],
            ["1","0","1","0","1","0","0","1","0","1"],
            ["1","0","0","1","1","1","0","1","0","0"],
            ["0","0","1","0","0","1","1","1","1","0"],
            ["1","0","1","1","1","0","0","1","1","1"],
            ["1","1","1","1","1","1","1","1","0","1"],
            ["1","0","1","1","1","1","1","1","1","0"]
        ]))
    }
}

fileprivate final class Solution {
    typealias I = Int
    typealias J = Int
    private let ocean = Character("0")
    private let island = Character("1")
    private let exploredOcean = Character("_") // for easier visual debugging
    private let exploredIsland = Character("i") // for easier visual debugging

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid // update the grid in place
        var count = 0

        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == ocean {
                    markConnectedArea(grid: &grid, startI: i, startJ: j, target: ocean, mark: exploredOcean)
                } else if grid[i][j] == island {
                    markConnectedArea(grid: &grid, startI: i, startJ: j, target: island, mark: exploredIsland)
                    count += 1
                }
                // else: no op for exploredOcean and exploredIsland
            }
        }

        return count
    }

    private func markConnectedArea(grid: inout [[Character]], startI: I, startJ: J, target: Character, mark: Character) {
        var candidates: [(I, J)] = [(startI, startJ)]
        grid[startI][startJ] = mark

        while !candidates.isEmpty {
            let (i, j) = candidates.removeFirst()
            //printGrid(grid)

            // north
            if 0 <= i - 1, grid[i - 1][j] == target {
                grid[i - 1][j] = mark
                candidates.append((i - 1, j))
            }

            // west
            if 0 <= j - 1, grid[i][j - 1] == target {
                grid[i][j - 1] = mark
                candidates.append((i, j - 1))
            }

            // south
            if i + 1 < grid.count, grid[i + 1][j] == target {
                grid[i + 1][j] = mark
                candidates.append((i + 1, j))
            }

            // east
            if j + 1 < grid[i].count, grid[i][j + 1] == target {
                grid[i][j + 1] = mark
                candidates.append((i, j + 1))
            }
        }
        //printGrid(grid)
    }

    private func printGrid(_ grid: [[Character]]) {
        print("[")
        grid.forEach {
            print($0.reduce("  ") { $0 + " \($1)" })
        }
        print("]")
    }
}
