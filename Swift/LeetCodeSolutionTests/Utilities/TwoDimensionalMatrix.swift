//
//  TwoDimensionalMatrix.swift
//  LeetCodeSolutions
//
//  Created by Haoxin Li on 8/5/18.
//  Copyright © 2018 Haoxin Li. All rights reserved.
//

import Foundation

protocol TwoDimensionalMatrix {
    
    associatedtype Element
    
    var matrix: [[Element]] { get }
}

struct TwoDimensionalMatrixLocation: Hashable {
    let row: Int
    let column: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(row)
        hasher.combine(column)
    }
}

enum TwoDimentionalMatrixDirection {
    case up
    case right
    case down
    case left
    
    static let allDirections = [up, right, down, left]
}

extension TwoDimensionalMatrix {
    
    var isValidMatrix: Bool {
        guard let firstRow = matrix.first else {
            return true // empty matrix is a valid matrix
        }
        for row in matrix.dropFirst() {
            guard row.count == firstRow.count else {
                return false
            }
        }
        return true
    }
    
    var rowCount: Int {
        return matrix.count
    }
    
    var columnCount: Int {
        return matrix.first?.count ?? 0
    }
    
    func element(at location: TwoDimensionalMatrixLocation) -> Element {
        return matrix[location.row][location.column]
    }
    
    func isValidLocation(_ location: TwoDimensionalMatrixLocation) -> Bool {
        return 0 <= location.row && location.row < rowCount && 0 <= location.column && location.column < columnCount
    }
    
    func location(at direction: TwoDimentionalMatrixDirection, ofLocation location: TwoDimensionalMatrixLocation) -> TwoDimensionalMatrixLocation? {
        let newLocation: TwoDimensionalMatrixLocation
        switch direction {
        case .up:
            newLocation = TwoDimensionalMatrixLocation(row: location.row - 1, column: location.column)
        case .right:
            newLocation = TwoDimensionalMatrixLocation(row: location.row, column: location.column + 1)
        case .down:
            newLocation = TwoDimensionalMatrixLocation(row: location.row + 1, column: location.column)
        case .left:
            newLocation = TwoDimensionalMatrixLocation(row: location.row, column: location.column - 1)
        }
        return isValidLocation(newLocation) ? newLocation : nil
    }
    
    func neighbors(of location: TwoDimensionalMatrixLocation) -> [TwoDimensionalMatrixLocation] {
        return TwoDimentionalMatrixDirection.allDirections.compactMap {
            self.location(at: $0, ofLocation: location)
        }
    }
}
