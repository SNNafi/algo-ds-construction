//
// Created by Shahriar Nasim Nafi on 7/7/22.
//

struct MaxHeapify<T: Comparable> {
    
    static func leftChild(for index: Int) -> Int {
        (index + 1) * 2 - 1
    }
    
    static func rightChild(for index: Int) -> Int {
        (index + 1) * 2
    }
    
    static func parent(for index: Int) -> Int {
        (index + 1) / 2 - 1
    }
    
    static func maxHeapify(heap: inout [T], heapSize: Int, root: Int) {
        var largest = root
        let left = leftChild(for: root)
        let right = rightChild(for: root)
        
        if (left <= heapSize && heap[left] > heap[largest]) {
            largest = left
        }
        
        if (right <= heapSize && heap[right] > heap[largest]) {
            largest = right
        }
        
        if root != largest {
            (heap[root], heap[largest]) = (heap[largest], heap[root])
            maxHeapify(heap: &heap, heapSize: heapSize, root: largest)
        }
    }
    
    static func buildMaxHeap(heap: inout [T], heapSize: Int) {
        for i in stride(from: heapSize / 2 - 1 , through: 0, by: -1) {
            maxHeapify(heap: &heap, heapSize: heapSize, root: i)
        }
    }
    
    static func printHeap(heap: [T], heapSize: Int, root: Int) {
        if root > heapSize {
            return
        }
        
        print(heap[root])
        
        let left = leftChild(for: root)
        let right = rightChild(for: root)
        
        if left <= heapSize {
            print(heap[root], "->", heap[left])
        }
        
        if right <= heapSize {
            print(heap[root], "->", heap[right])
        }
        
        printHeap(heap: heap, heapSize: heapSize, root: left)
        printHeap(heap: heap, heapSize: heapSize, root: right)
    }
    
    static func heapSort(heap: inout [T], heapSize: Int) {
        for i in stride(from: heapSize, to: 0, by: -1) {
            (heap[i], heap[0]) = (heap[0], heap[i])
            maxHeapify(heap: &heap, heapSize: i - 1, root: 0)
        }
    }
    
    static func heapSorted(array: [T]) -> [T] {
        var sorted = array
        let heapSize =  array.count - 1
        
        buildMaxHeap(heap: &sorted, heapSize: heapSize)
        
        for i in stride(from: heapSize, to: 0, by: -1) {
            (sorted[i], sorted[0]) = (sorted[0], sorted[i])
            maxHeapify(heap: &sorted, heapSize: i - 1, root: 0)
        }
        
        return sorted
    }
    
}


struct PriorityQueue<T: Comparable> {
    static func extractMax(heap: inout [T]) -> T {
        let max = heap[0]
        
        heap[0] = heap[heap.count - 1]
        heap.removeLast()
        
        MaxHeapify.maxHeapify(heap: &heap, heapSize: heap.count - 1, root: 0)
        
        return max
    }
    
    static func insert(value: T, heap: inout [T]) {
        heap.append(value)
        
        var i = heap.count - 1
        var p = MaxHeapify<T>.parent(for: i)
        
        while i > 0 && heap[i] > heap[p] {
            (heap[i], heap[p]) = (heap[p], heap[i])
            i = p
            p = MaxHeapify<T>.parent(for: i)
        }
    }
}


