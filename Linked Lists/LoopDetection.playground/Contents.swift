/*
Problem: Given a circular linked list, implement an algorithm that returns the node at the beginning of the loop.

Approaches:
   1) Keep two nodes, one that increments one node at a time and a runner node that
      traverses 2x as fast as the other pointer, eventually the pointers will meet at
      a common node, i.e. the node that causes the linked list to be circular.

Solutions 1 is presented below.
*/

import SwiftUI

/// Given a circular linked list, return the node at the beginning of the loop.
func loopDetection<T>(linkedList: LinkedList<T>) -> LinkedList<T>.Node {
    var nodePointer = linkedList.head
    var runner = linkedList.head?.next

    while true {
        if nodePointer?.value == runner?.value { break }
        nodePointer = nodePointer?.next
        runner = runner?.next?.next
    }

    return runner!
}
