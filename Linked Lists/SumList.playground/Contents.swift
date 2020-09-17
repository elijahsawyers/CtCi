/*
Problem: Given two linked lists that represent numbers, compute their sum.

Approaches:
   1)

Solutions 1 is presented below.
*/

import SwiftUI

/// Given two linked list representing numbers in reverse order, return a list representing the sum of the two lists.
func sumListReverse(_ a: LinkedList<Int>, _ b: LinkedList<Int>) -> LinkedList<Int> {
    let sum = LinkedList<Int>()
    var carry = 0
    var a = a.head
    var b = b.head
    
    while a != nil && b != nil {
        if let aVal = a?.value, let bVal = b?.value {
            let value = aVal + bVal + carry >= 10 ?
                aVal + bVal + carry - 10 :
                aVal + bVal + carry
            carry = aVal + bVal + carry >= 10 ? 1 : 0
            sum.appendNodeToEnd(withValue: value)
        }
        
        a = a?.next
        b = b?.next
    }
    
    if a != nil {
        while a != nil {
            if let aVal = a?.value {
                let value = aVal + carry >= 10 ? aVal + carry - 10 : aVal + carry
                carry = aVal + carry >= 10 ? 1 : 0
                sum.appendNodeToEnd(withValue: value)
            }
            
            a = a?.next
        }
    }
    
    if b != nil {
        while b != nil {
            if let bVal = b?.value {
                let value = bVal + carry >= 10 ? bVal + carry - 10 : bVal + carry
                carry = bVal + carry >= 10 ? 1 : 0
                sum.appendNodeToEnd(withValue: value)
            }
            
            b = b?.next
        }
    }
    
    if carry != 0 {
        sum.appendNodeToEnd(withValue: 1)
    }
    
    return sum
}

/// Given two linked list representing numbers, return a list representing the sum of the two lists.
func sumList(_ a: LinkedList<Int>, _ b: LinkedList<Int>) -> LinkedList<Int> {
    // TODO
    return LinkedList<Int>()
}

func main() {
    let a = LinkedList<Int>()
    let b = LinkedList<Int>()
    
    a.appendNodeToEnd(withValue: 9)
    a.appendNodeToEnd(withValue: 7)
    a.appendNodeToEnd(withValue: 8)
    
    b.appendNodeToEnd(withValue: 6)
    b.appendNodeToEnd(withValue: 8)
    b.appendNodeToEnd(withValue: 5)
    
    let c = sumListReverse(a, b)
    c.output()
}

main()
