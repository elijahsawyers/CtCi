import Foundation

/// Singly linked list class to be used for all CtCI linked list problems.
public class LinkedList<T: Hashable> {
    /// Linked list node.
    public class Node {
        public var value: T
        public var next: Node?

        public init(value: T, next: Node? = nil) {
            self.value = value
            self.next = next
        }
    }

    /// Head (a.k.a. the first element) of the linked list.
    public var head: Node?

    /// Appends a node with the value `value` to the end of the list.
    public func appendNodeToEnd(withValue value: T) {
        if head == nil {
            head = Node(value: value)
        } else {
            var tmp = head
            while tmp?.next != nil {
                tmp = tmp?.next
            }
            tmp?.next = Node(value: value)
        }
    }

    /// Appends a node with the value `value` to the front of the list.
    public func appendNodeToFront(withValue value: T) {
        if head == nil {
            head = Node(value: value)
        } else {
            let newNode = Node(value: value, next: head)
            head = newNode
        }
    }
    
    /// Prints out the linked list.
    public func output() {
        var tmp = head
        while tmp != nil {
            print(tmp?.value ?? "", terminator: "")
            if tmp?.next != nil { print(" -> ", terminator: "") }
            else { print("") }
            tmp = tmp?.next
        }
    }
    
    /// Default init.
    public init() {}
}
