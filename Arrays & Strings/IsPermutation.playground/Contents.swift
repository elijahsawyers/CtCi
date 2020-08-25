/*
Problem: given two strings, determine if one is a permutation of the other.

Approaches:
   1) Use a hash table to store each character already seen and its frequency.
   O(N) time and space complexity.
   2) Sort both of the strings and loop over them. O(NlogN).

Solution 1 is presented below.
*/

import SwiftUI

extension String {
    /// Checks if `self` is a permutation of `otherString`.
    func isPermutation(of otherString: String) -> Bool {
        if self.count != otherString.count { return false }
        let characterArray = [Character](self)
        let otherCharacterArray = [Character](otherString)
        var characterFrequencyHashTable = [Character: Int]()
        
        // Form the frequency counter hash table.
        for character in otherCharacterArray {
            if characterFrequencyHashTable[character] != nil {
                characterFrequencyHashTable[character]! += 1
            } else {
                characterFrequencyHashTable[character] = 1
            }
        }
        
        // Determine whether self is a permutation of otherString, based on the hash table.
        for character in characterArray {
            if (
                characterFrequencyHashTable[character] == 0 ||
                characterFrequencyHashTable[character] == nil
            ) {
                return false
            }
            characterFrequencyHashTable[character]! -= 1
        }

        return true
    }
}

/// Determines if `stringOne` is a permutation of `stringTwo`, or vice versa.
func isPermutation(_ stringOne: String, _ stringTwo: String) -> Bool {
    stringOne.isPermutation(of: stringTwo) || stringTwo.isPermutation(of: stringOne)
}
