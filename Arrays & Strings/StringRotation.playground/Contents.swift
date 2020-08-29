/*
Problem: given two strings, s1 and s2, determine if s2 is a rotation of s1.

Approaches:
   1) The obvious solution to this problem is to shift s2 until s1 and s2 match. The complexity is O(N^2)
      time and O(1) space.
   2) The better solution is to concatenate s2 + s2 and make a call to s1.isSubstring(s2). The complexity
      is O(N) time and O(N) space.
 
Solution 2 is presented below.
*/

import SwiftUI

extension String {
    /// Determines if `self` is a rotation of `string`.
    ///
    /// Example: if `self` is "erbottlewat" and `string` is "waterbottle",
    /// this function would return `true`.
    func isRotation(of string: String) -> Bool {
        if self.count != string.count { return false }
        let concatenatedString = self + self
        return concatenatedString.contains(string)
    }
}
