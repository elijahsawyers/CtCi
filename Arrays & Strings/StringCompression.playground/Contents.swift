/*
Problem: given a string, compress it. Input: "aabbccddeee", Output: "a2b2c2d2e3"

Approaches:
   1) Loop over the string with a count of the current character. When a new character is
      reached, put the previous letter and the count into the new string. O(N) time and O(1)
      space complexity. Note - this method assumes that string concatenation in Swift is O(1)
      time complexity. If it weren't, it'd be necessary to optimize the code with a dynamic
      array of some sort to acheive O(N) runtime.

Solutions 1 is presented below.
*/

import SwiftUI

extension String {
    /// Returns a compressed String from `self`.
    ///
    /// For example, the string "aaabbbcc" would return "a3b3c2".
    /// - Note: if the compressed String isn't shorter in length than `self`, `self` is returned.
    func compressed() -> String {
        if self.count == 0 { return self }
        let characterArray = [Character](self)
        var currentCharacter: Character = characterArray[0]
        var currentCharacterCount = 0
        var compressedString = ""
        
        // Loop over characters, counting the frequency, and adding the character and
        // frequency to the compressed string when a new character is reached.
        for character in characterArray {
            if character == currentCharacter {
                currentCharacterCount += 1
            } else {
                compressedString += String(currentCharacter) + String(currentCharacterCount)
                currentCharacter = character
                currentCharacterCount = 1
            }
        }
        compressedString += String(currentCharacter) + String(currentCharacterCount)
        
        // Don't return the compressed string if it's not shorter than the original string.
        return compressedString.count < self.count ? compressedString : self
    }
}
