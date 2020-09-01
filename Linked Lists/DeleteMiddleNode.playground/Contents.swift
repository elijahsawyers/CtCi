import SwiftUI

/// Given a node in the middle of a linked list, delete it.
func deleteMiddleNode<T>(_ node: LinkedList<T>.Node) {
    // Make the current node value = node.next.
    if let nextValue = node.next?.value {
        node.value = nextValue
        node.next = node.next?.next
    }
}
