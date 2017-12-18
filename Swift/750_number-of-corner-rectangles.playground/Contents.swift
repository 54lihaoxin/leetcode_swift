/*
 Given a grid where each entry is only 0 or 1, find the number of corner rectangles.
 
 A corner rectangle is 4 distinct 1s on the grid that form an axis-aligned rectangle. Note that only the corners need to have the value 1. Also, all four 1s used must be distinct.
 
 Example 1:
 Input: grid =
 [[1, 0, 0, 1, 0],
 [0, 0, 1, 0, 1],
 [0, 0, 0, 1, 0],
 [1, 0, 1, 0, 1]]
 Output: 1
 Explanation: There is only one corner rectangle, with corners grid[1][2], grid[1][4], grid[3][2], grid[3][4].
 Example 2:
 Input: grid =
 [[1, 1, 1],
 [1, 1, 1],
 [1, 1, 1]]
 Output: 9
 Explanation: There are four 2x2 rectangles, four 2x3 and 3x2 rectangles, and one 3x3 rectangle.
 Example 3:
 Input: grid =
 [[1, 1, 1, 1]]
 Output: 0
 Explanation: Rectangles must have four distinct corners.
 Note:
 The number of rows and columns of grid will each be in the range [1, 200].
 Each grid[i][j] will be either 0 or 1.
 The number of 1s in the grid will be at most 6000.
 */

class Solution {
    func countCornerRectangles(_ grid: [[Int]]) -> Int {
        // sanity check for grid dimension
        guard grid.count > 1, let firstRow = grid.first, firstRow.count > 1 else { return 0 }
        for row in grid {
            guard row.count == firstRow.count else { return 0 }
        }
        
        let indexOffsetA = 1    // use (i + 1) instead of i because the product is 0 if i is 0
        let indexOffsetB = indexOffsetA + firstRow.count * firstRow.count  // add offset (i + 1 + rowCount ^ 2) to uniquely identify the 2nd corner
        let indexSetArray: [Set<Int>] = grid.map { row in
            var indexSet: Set<Int> = []
            for i in 0..<(row.count - 1) {
                guard row[i].isCorner else { continue }
                for ii in (i + 1)..<row.count {
                    guard row[ii].isCorner else { continue }
                    indexSet.insert((i + indexOffsetA) * (ii + indexOffsetB))   // this identifies a corner pair
                }
            }
            return indexSet
        }
        
        var count = 0
        for i in 0..<(indexSetArray.count - 1) {
            let setA = indexSetArray[i]
            guard !setA.isEmpty else { continue }
            for ii in (i + 1)..<indexSetArray.count {
                let setB = indexSetArray[ii]
                guard !setB.isEmpty else { continue }
                for index in setB {
                    if setA.contains(index) {
                        count += 1
                    }
                }
            }
        }
        
        return count
    }
}

extension Int {
    var isCorner: Bool {
        return self == 1
    }
}

// MARK: - Test Cases

let solution = Solution()
guard 9 == solution.countCornerRectangles([[1, 1, 1],
                                           [1, 1, 1],
                                           [1, 1, 1]]) else { fatalError() }

print("All tests passed")

