/*
 Problem: given an unsorted linked list, remove duplicates.
 
 Solutions:
    1) One way to accomplish this would be to run through the list and check for duplicates for each
       and every value with another loop running ahead, removing duplicates when found. Runtime would
       be O(N^2) and O(1) space.
    2) Another way would be to maintain a hash table, and when looping through the list, if a value
       has already been seen, remove it. This would be O(N) runtime and O(N) space.
 
 Solution 2 is presented below.
 */

import SwiftUI

/// Given a singly linked list, remove all duplicate values.
func removeDups<T: Hashable>(linkedList: LinkedList<T>) {
    var valuesSeen = [T: Bool]()
    var tmp = linkedList.head
    
    if tmp != nil {
        if let value = tmp?.value {
            valuesSeen[value] = true
        }
    }
    
    while tmp?.next != nil {
        if let value = tmp?.next?.value {
            if valuesSeen[value] != nil {
                tmp?.next = tmp?.next?.next
                continue
            } else {
                valuesSeen[value] = true
            }
        }
        tmp = tmp?.next
    }
}
