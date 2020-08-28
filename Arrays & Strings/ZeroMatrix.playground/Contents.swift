/*
Problem: given a MxN matrix, if a value is 0, change the value's entire row and column to 0s.

Approaches:
   1) Loop over the entire matrix, and if a value is zero, update a hash table containing the
      rows and columns that need to be "zeroed." After determining the rows and columns that need
      to be "zeroed," actually zero them. O(M*N) time and O(M + N) space.
   2) The better option is to use the first row and column as the way to tell whether or not the
      row and/or column need to be "zeroed." Loop over each value in the matrix, if the value is
      0, set matrix[0][j] to 0 and matrix [i][0] to 0. Finally, loop over the first row and column,
      "zeroing" the rows and/or columns that need to be "zeroed." O(M*N) time and O(1) space.
 
Solution 2 is presented below.
*/

import SwiftUI

func zeroMatrix<T: Numeric>(_ matrix: inout [[T]], m: Int, n: Int) {
    /// Changes a row to all zeros.
    func zeroRow(_ row: Int) {
        for i in 0..<n {
            matrix[row][i] = 0
        }
    }
    
    /// Changes a column to all zeros.
    func zeroColumn(_ column: Int) {
        for i in 0..<m {
            matrix[i][column] = 0
        }
    }

    // First, determine if the first row and column need to be zeroed.
    var zeroFirstRow = false
    var zeroFirstColumn = false

    for i in 0..<n {
        if matrix[0][i] == 0 { zeroFirstRow = true; break }
    }

    for i in 0..<m {
        if matrix[i][0] == 0 { zeroFirstColumn = true; break }
    }
    
    // Next, loop through each value in the matrix, properly setting matrix[i][0] and
    // matrix[0][j].
    for i in 1..<m {
        for j in 1..<n {
            if matrix[i][j] == 0 {
                matrix[i][0] = 0
                matrix[0][j] = 0
            }
        }
    }
    
    // Clear the necessary rows and columns.
    for i in 0..<m {
        if matrix[i][0] == 0 { zeroRow(i) }
    }

    for i in 0..<n {
        if matrix[0][i] == 0 { zeroColumn(i) }
    }
    
    if zeroFirstRow { zeroRow(0) }
    if zeroFirstColumn { zeroColumn(0) }
}
