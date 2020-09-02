/*
Problem: Given a linked list, find the kth to last element. A more interesting problem
         is finding the kth largest element, which is what this playground solves.

Approaches:
   1) Use quick sort to sort the linked list, then iterate over the sorted list to the
      kth from last place. O(NlgN) time and O(1) space complexity.
   2) Use merge sort to sort the linked list, then iterate over the sorted list to the
      kth from last place. O(NlgN) time and O(N) space complexity.
   3) Create a max heap from the linked list, then extract min k times. O(N) time and
      O(N) space - this is because it only takes O(N) time to build the heap and,
      at worst, O(N) to extract min k times.
   4) Iteratively find the min k times. O(N^2) time and O(1) space.

Solutions 3 is presented below.
*/

import SwiftUI

class MaxHeap<T: Comparable> where T: Hashable {
    /// The array used for heap implementation.
    var heap = [T]()
    
    /// Initialize a max heap from a linked list.
    init(linkedList: LinkedList<T>) {
        var tmp = linkedList.head
        while tmp != nil {
            heap.append(tmp!.value)
            tmp = tmp?.next
        }
        var i = (heap.count / 2) - 1
        
        while i >= 0 {
            heapify(index: i)
            i -= 1
        }
    }
    
    /// Fix heap order starting at `index`.
    func heapify(index: Int) {
        let leftChild = leftChildOfNode(at: index)
        let rightChild = rightChildOfNode(at: index)
        var largest = index

        // Left child is the biggest.
        if leftChild != nil && heap[largest] < heap[leftChild!] {
            largest = leftChild!
        }
        
        // Right child is the biggest.
        if rightChild != nil && heap[largest] < heap[rightChild!] {
            largest = rightChild!
        }
        
        // If the biggest node isn't the current node, continue heapifying.
        if largest != index {
            swapValuesAtIndices(index, largest)
            heapify(index: largest)
        }
    }
    
    /// Swaps two values in the heap at `a` and `b`.
    func swapValuesAtIndices(_ a: Int, _ b: Int) {
        let tmp = heap[a]
        heap[a] = heap[b]
        heap[b] = tmp
    }
    
    /// Returns the max value in the heap.
    func extractMax() -> T {
        // If one element in the heap, return it.
        if heap.count == 1 {
            let value = heap[0]
            heap.remove(at: 0)
            return value
        }
        
        // Otherwise, set the last element as the first then fix heap order.
        let value = heap[0]
        heap[0] = heap[heap.count - 1]
        heap.remove(at: heap.count - 1)
        heapify(index: 0)
        return value
    }

    /// Returns the parent of the node at `index`, if it has one.
    func parentOfNode(at index: Int) -> Int? {
        (index - 1) / 2 > -1 ? (index - 1) / 2 : nil
    }
    
    /// Returns the left child of the node at `index`, if it has one.
    func leftChildOfNode(at index: Int) -> Int? {
        (2 * index) + 1 < heap.count - 1 ? (2 * index) + 1 : nil
    }
    
    /// Returns the right child of the node at `index`, if it has one.
    func rightChildOfNode(at index: Int) -> Int? {
        (2 * index) + 2 < heap.count - 1 ? (2 * index) + 2 : nil
    }
}

/// Given a linked list, returns the kth largest element in the list.
func kthLargest<T: Comparable>(linkedList: LinkedList<T>, k: Int) -> T {
    let heap = MaxHeap<T>(linkedList: linkedList)
    for _ in 0..<k-1 {
        heap.extractMax()
    }
    return heap.extractMax()
}
