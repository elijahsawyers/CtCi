/*
Problem: Partition a linked list around a given value.

Approaches:
   1) Make a single passthrough of the list, and if a node's value is less than
      the partition, make it the new head of the list.

Solutions 1 is presented below.
*/

import SwiftUI

extension LinkedList where T: Comparable {
    /// Partitions a linked list around `value`. Makes all nodes less than `value` come before
    /// nodes greater than or equal to `value`.
    func partition(around value: T) {
        if self.head  == nil { return }
        var tmp = self.head
        
        while tmp?.next != nil {
            if let tmpValue = tmp?.next?.value, tmpValue < value {
                let nodeToAppendToHead = tmp?.next
                tmp?.next = tmp?.next?.next
                nodeToAppendToHead?.next = self.head
                self.head = nodeToAppendToHead
            } else {
                tmp = tmp?.next
            }
        }
    }
}

func main() {
    let values = [
        5, 2
    ]
    let linkedList = LinkedList<Int>()
    
    for value in values {
        linkedList.appendNodeToEnd(withValue: value)
    }
    
    linkedList.output()
    linkedList.partition(around: 5)
    linkedList.output()
}

main()
