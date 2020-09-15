/*
Problem: Given only a node in the middle of a linked list, delete it.

Approaches:
   1) Make a duplicate of the next node then delete the next node.

Solutions 1 is presented below.
*/

import SwiftUI

/// Given a node in the middle of a linked list, delete it.
func deleteMiddleNode<T>(_ node: LinkedList<T>.Node) {
    // Make the current node value = node.next.
    if let nextValue = node.next?.value {
        node.value = nextValue
        node.next = node.next?.next
    }
}
