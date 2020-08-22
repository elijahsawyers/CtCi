/*
Problem: URLify a string - replace all spaces with %20.

Approaches:
   1) Loop over the string in reverse order while keeping two pointers - one at the next
   insertion slot, and one on the character to insert. O(N) runtime and O(1) space.

Solution 1 is presented below.
*/

import SwiftUI

/// Given a string, "URLify" it. (i.e. convert the spaces to %20).
/// It's assumed that the length of the actual string will be given in `length`.
/// It's also assumed that there is plenty of space it the end of the string to fit
/// the insertion of each of the "%20" substrings.
///
/// Example: "Mr John Smith    " would become "Mr%20John%20Smith".
func URLify(_ string: inout String, _ length: Int) {
    let UrlSpace = [Character]("%20")
    var characterArray = [Character](string)
    var i = length - 1 // The index of the character to insert.
    var j = string.count - 1 // The index of insertion.

    while i >= 0 {
        if characterArray[i] != " " {
            characterArray[j] = characterArray[i]
            j -= 1
        } else {
            for k in 1...UrlSpace.count {
                characterArray[j] = UrlSpace[UrlSpace.count - k]
                j -= 1
            }
        }
        i -= 1
    }
    
    string = String(characterArray)
}
