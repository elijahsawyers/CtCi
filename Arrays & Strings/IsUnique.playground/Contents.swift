/*
 Problem: given a string, determine whether or not all of its characters
 are unique.
 
 Approaches:
    1) Use a hash table to store each character already seen while looping
    over the string. O(N) time and space complexity.
    2) Sort the string then loop over the string, comparing the current
    character with the next character.
    3) Use the bit vectore to determine whether or not the character has
    been seen. O(N) time and O(1) space complexity. Works with input a-z.

 Solutions 1 and 3 are presented below.
 */

import SwiftUI

extension String {
    /// Determines whether or not each character in the string is unique.
    ///
    /// - Complexity: O(N) time and space; each character must be
    /// visited at least once.
    var isUniqueHashTable: Bool {
        let characterArray = [Character](self)
        var characterHashTable = [Character: Bool]()
        
        for character in characterArray {
            if characterHashTable[character] != nil {
                return false
            } else {
                characterHashTable[character] = true
            }
        }
        
        return true
    }
    
    /// Determines whether or not each character in the string is unique, using the bit vectors.
    ///
    /// - Complexity: O(N) time and O(1) space; each character must be
    /// visited at least once.
    var isUniqueBitVector: Bool {
        let characterArray = [Character](self)
        var checker = 0
        
        for character in characterArray {
            let value = Int(character.asciiValue!) - 97
            
            if (checker & (1 << value)) > 0 {
                return false
            } else {
                checker |= (1 << value)
            }
        }

        return true
    }
}
