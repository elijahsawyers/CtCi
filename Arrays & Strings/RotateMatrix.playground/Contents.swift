/*
Problem: given a NxN matrix, rotate it 90deg.

Approaches:
   1) The obvious solution to this problem is to make the rows become columns.
      Allocate space for a new NxN matrix and copy the rows into the columns.
      This has O(N^2) time and space complexity.
   2) The better solution is to do it in-place, just looping over all values from
      the outside in, swapping the positions. O(N^2) time and O(1) space.

Solutions 2 is presented below.
*/

import SwiftUI

func rotate<T>(_ matrix: inout [[T]], _ n: Int) {
    for i in 0..<n/2 {
        for j in i..<n-1 {
            let tmp = matrix[i][j]

            for k in 0..<4 {
                switch k {
                case 0:
                    matrix[i][j] = matrix[n - 1 - j][i]
                case 1:
                    matrix[n - 1 - j][i] = matrix[n - 1 - i][n - 1 - j]
                case 2:
                    matrix[n - 1 - i][n - 1 - j] = matrix[j][n - 1 - i]
                case 3:
                    matrix[j][n - 1 - i] = tmp
                default:
                    break
                }
            }
        }
    }
}

func main() {
    var test = [
        [01, 02, 03, 04],
        [05, 06, 07, 08],
        [09, 10, 11, 12],
        [13, 14, 15, 16]
    ]
    
    rotate(&test, 4)
    
    for row in test {
        print(row)
    }
}

main()
