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
    
    for i in 0..<n {
        for j in i..<n {
            // TODO
        }
    }
}
