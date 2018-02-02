/*
 
 766. Toeplitz Matrix
 
 A matrix is Toeplitz if every diagonal from top-left to bottom-right has the same element.
 
 Now given an M x N matrix, return True if and only if the matrix is Toeplitz.
 
 
 Example 1:
 
 Input: matrix = [[1,2,3,4],[5,1,2,3],[9,5,1,2]]
 Output: True
 Explanation:
 1234
 5123
 9512
 
 In the above grid, the diagonals are "[9]", "[5, 5]", "[1, 1, 1]", "[2, 2, 2]", "[3, 3]", "[4]", and in each diagonal all elements are the same, so the answer is True.
 Example 2:
 
 Input: matrix = [[1,2],[2,2]]
 Output: False
 Explanation:
 The diagonal "[1, 2]" has different elements.
 Note:
 
 matrix will be a 2D array of integers.
 matrix will have a number of rows and columns in range [1, 20].
 matrix[i][j] will be integers in range [0, 99].
 */

class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        
        // This is more complicated yet stupid solution... The best one is simply loop through every element and compare with the previous diagonal neighbor.
        
        guard let firstRow = matrix.first, firstRow.count > 0 else { return false }
        guard matrix.count > 1 else { return true } // special case
        let initialDiagonalIndex = -matrix.count + 1
        
        for i in initialDiagonalIndex..<firstRow.count {    // loop through diagonals
            let initialRow = -min(0, i)
            let initialColumn = max(0, i)
            var curRow = initialRow + 1
            var curColumn = initialColumn + 1
            while curRow < matrix.count, curColumn < firstRow.count {
                if matrix[curRow - 1][curColumn - 1] != matrix[curRow][curColumn] { // compare with previous diagonal neighbor
                    return false
                }
                curRow += 1
                curColumn += 1
            }
        }
        
        return true
    }
}

let solution = Solution()
guard true == solution.isToeplitzMatrix([[1,2,3,4],
                                         [5,1,2,3],
                                         [9,5,1,2]]) else { fatalError() }
guard false == solution.isToeplitzMatrix([[1,2],
                                          [2,2]]) else { fatalError() }

print("All tests passed")

