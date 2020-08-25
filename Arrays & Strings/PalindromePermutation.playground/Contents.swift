/*
Problem: given a string, determine if it's a permutation of a palindrome.

Approaches:
   1) In order to be a permutation of a palindrome, there cannot be more than
      one character that has an odd character count. Therefore, hash all character
      frequencies, and check to see if there's more than one character with an odd
      frequency. O(N) time and space complexity.

Solution 1 is presented below.
*/

import SwiftUI

extension String {
    /// Determine if `self` is a permutation of a palindrome.
    ///
    /// In order to be a permutation of a palindrome, the string cannot contain more
    /// than one character with an odd frequency.
    /// - Complexity: O(N) time and space.
    var isPalindromePermutation: Bool {
        let characterArray = [Character](self)
        var characterFrequencyHashTable = [Character: Int]()
        var oddNumberCount = 0
        
        // Store each character's frequency.
        for character in characterArray {
            if characterFrequencyHashTable[character] != nil {
                characterFrequencyHashTable[character]! += 1
            } else {
                characterFrequencyHashTable[character] = 1
            }
        }
        
        // Determine the number of odd frequencies.
        for (_, frequency) in characterFrequencyHashTable {
            if frequency % 2 == 1 {
                oddNumberCount += 1
            }
        }
        
        // If more than one odd frequency, return false.
        return oddNumberCount < 2
    }
}
