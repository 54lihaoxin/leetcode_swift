/*
 
 733. Flood Fill
 
 An image is represented by a 2-D array of integers, each integer representing the pixel value of the image (from 0 to 65535).
 
 Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
 
 To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same color as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same color as the starting pixel), and so on. Replace the color of all of the aforementioned pixels with the newColor.
 
 At the end, return the modified image.
 
 Example 1:
 Input:
 image = [[1,1,1],[1,1,0],[1,0,1]]
 sr = 1, sc = 1, newColor = 2
 Output: [[2,2,2],[2,2,0],[2,0,1]]
 Explanation:
 From the center of the image (with position (sr, sc) = (1, 1)), all pixels connected
 by a path of the same color as the starting pixel are colored with the new color.
 Note the bottom corner is not colored 2, because it is not 4-directionally connected
 to the starting pixel.
 Note:
 
 The length of image and image[0] will be in the range [1, 50].
 The given starting pixel will satisfy 0 <= sr < image.length and 0 <= sc < image[0].length.
 The value of each color in image[i][j] and newColor will be an integer in [0, 65535].
 */

class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        var result = image
        var toFill: [(Int, Int)] = [(sr, sc)]   // (row, column)
        let originalColor = image[sr][sc]
        while !toFill.isEmpty {
            let (r, c) = toFill.removeLast()
            result[r][c] = newColor
            let neighbors = [(r - 1, c), (r + 1, c), (r, c - 1), (r, c + 1)]
            for (nr, nc) in neighbors {
                guard
                    0 <= nr, nr < result.count,
                    0 <= nc, nc < result[0].count,
                    result[nr][nc] == originalColor,
                    result[nr][nc] != newColor
                    else { continue }
                toFill.append((nr, nc))
            }
        }
        return result
    }
}

func ==(lhs: [[Int]], rhs: [[Int]]) -> Bool {
    guard lhs.count == rhs.count else { return false }
    for (i, lhsRow) in lhs.enumerated() {
        if lhsRow != rhs[i] {
            return false
        }
    }
    return true
}

let solution = Solution()
guard [[2,2,2],[2,2,0],[2,0,1]] == solution.floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2) else { fatalError() }

print("All tests passed")

